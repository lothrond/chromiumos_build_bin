# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

## BEGIN CHROMIUM OS BUILD ENVIRONMENT:

SYSTEM_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
USER_PATH=~/bin:~/.local/bin
DEPOT_TOOLS=~/depot_tools

export PATH=${USER_PATH}:${SYSTEM_PATH}:${DEPOT_TOOLS}
export SOURCE_REPO=~/chromiumos
export REPOSYNC="-j8"

# misc
#GIT_DISCOVERY_ACROSS_FILESYSTEMS=true

## END CHROMIUM OS BUILD ENVIRONMENT.
