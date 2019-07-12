# Create or attach to Symfony tmux session
function tmux_symfony --description="Creates/attaches to tmux session for symfony, arg is directory"
    set -l project_path $argv[1]
    set -l project_name (string split -r -m1 '/' $project_path)[2]
    if $TMUX
        echo 'TMUX!'
    end
    if string match --quiet --ignore-case --regex "(astra-dash)" $project_path
        set server_command 'symfony proxy:start && symfony server:start --port=8002 --allow-http'
    else 
        set server_command 'symfony proxy:start && symfony server:start'
    end
    if -n $TMUX
        tmux \
    	    new-window -n $project_name \; \
            split-window -vb -p 25 $server_command \; \
    	    select-pane -D
    else
        tmux \
    	    new-session -AD -t symfony -c $project_path \; \
    	    rename-window $project_name \; \
            split-window -vb -p 25 $server_command \; \
    	    select-pane -D
    end
end