# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Correct symbols in TMUX
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Add ubuntu-make apps to $PATH if ubuntu-make is installed
if [ -d "$HOME/.local/share/umake/bin" ] ; then
    PATH=/home/vidur/.local/share/umake/bin:$PATH
fi
# Add Cargo & associated binaries to path if installed
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# Add go if installed
if [ -d "$HOME/go/bin" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

# Chromium API keys
if [ -f "$HOME/.chromium-api-keys" ]; then
    source ~/.chromium-api-keys;
fi

# GitLab API keys
if [ -f "$HOME/.gitlab-api-keys" ]; then
    source ~/.gitlab-api-keys;
fi

# AWS API keys
if [ -f "$HOME/.aws-api-keys" ]; then
    source ~/.aws-api-keys;
fi

if [ -d "$HOME/.npm_modules/bin" ] ; then
    PATH="$HOME/.npm_modules/bin:$PATH"
fi

if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$HOME/.composer/vendor/bin:$PATH"
fi
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

export PATH="$HOME/.cargo/bin:$PATH"
