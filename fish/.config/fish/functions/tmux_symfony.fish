# Create or attach to Symfony tmux session
function tmux_symfony --description="Creates/attaches to tmux session for symfony, arg is directory"
    set -l project_path $argv[1]
    set -l project_name (string split -r -m1 '/' $project_path)[2]
    if string match --quiet --ignore-case --regex "(dash)" $project_path
        set server_command 'symfony proxy:start && symfony server:start --port=8002 --allow-http'
        set project_name 'dash/core'
    else if string match --quiet --ignore-case --regex "(api)" $project_path
        set server_command 'symfony proxy:start && symfony server:start --port=8003 --allow-http'
        set project_name 'api/core'
    else if string match --quiet --ignore-case --regex "(vidur.dev)" $project_path
        set server_command 'symfony proxy:start && symfony server:start --port=8004 --allow-http'
        set project_name 'vidur.dev'
    else 
        set server_command 'symfony proxy:start && symfony server:start'
    end
    if test -n $TMUX
        tmux \
    	    new-window -n $project_name "cd $project_path && $SHELL" \; \
            split-window -vb -p 25 "cd $project_path && $server_command" \; \
    	    select-pane -D
    else
        tmux \
    	    new-session -AD -t symfony -c $project_path \; \
    	    rename-window $project_name \; \
            split-window -vb -p 25 $server_command \; \
    	    select-pane -D
    end
end
