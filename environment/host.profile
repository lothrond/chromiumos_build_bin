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
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

## BEGIN CHROMIUM OS BUILD ENVIRONMENT:
source ~/bin/environment/host.sh
## END CHROMIUM OS BUILD ENVIRONMENT.
## BEGIN CRYPTMOUNT ENVIRONMENT:
source ~/bin/environment/crypt.sh
## END CRYPTMOUNT ENVIRONMENT.
