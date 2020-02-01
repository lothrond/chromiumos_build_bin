#!/bin/bash

## BEGIN CHROMIUM OS BUILD ENVIRONMENT:

SYSTEM_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
USER_PATH=~/bin:~/.local/bin
DEPOT_TOOLS=~/depot_tools

export PATH=${USER_PATH}:${SYSTEM_PATH}:${DEPOT_TOOLS}
export SOURCE_REPO=~/chromiumos
export REPOSYNC="-j8"

## END CHROMIUM OS BUILD ENVIRONMENT.

# misc
#GIT_DISCOVERY_ACROSS_FILESYSTEMS=true
