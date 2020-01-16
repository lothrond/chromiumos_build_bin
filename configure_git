#!/bin/bash

set -o errexit

if [ -f ~/.gitconfig ]; then
    exit 0
fi

# If you have never used git before, you’ll need to set some global git configurations;
# substitute $GIT_USER_NAME with your name, and $GIT_USER_EMAIL with your email address.
if [ $# -eq 2 ]; then
    GIT_USER_NAME="$1"
    GIT_USER_EMAIL="$2"
elif [ $GIT_USER_NAME ] && [ $GIT_USER_EMAIL ]; then
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
    git config --global core.autocrlf false
    git config --global core.filemode false
    # and for fun!
    git config --global color.ui true
else
    echo "$(basename $0) [GIT_USER_NAME] [GIT_USER_EMAIL]"
    exit 1
fi

exit $?
