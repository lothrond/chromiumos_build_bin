# Chromium OS build host user profile.
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# if running bash
if [ $BASH_VERSION ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    source "$HOME/.bashrc"
    fi
fi

# environment
source ~/bin/environment/host.sh

# repo completion
[ -f "$HOME/etc/repo_bash_completion"   ] && . "$HOME/etc/repo_bash_completion"
    
# git prompt
export PS1='\h:\e[32m\W$(__git_ps1 "(%s)") \e[34m\u\e[0m:$ '
