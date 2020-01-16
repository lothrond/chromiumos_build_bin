#!/bin/bash

## BEGIN CHROMIUM OS HOST BUILD ENVIRONMENT

export PATH=~/bin:${PATH}:~/depot_tools

# chromiumos source code
export SOURCE_REPO=~/chromiumos

# repo sync
export REPOFLAGS="-j8"

# misc
export GIT_DISCOVERY_ACROSS_FILESYSTEMS=true

## END CHROMIUM OS HOST BUILD ENVIRONMENT
