#!/bin/bash

## BEGIN CHROMIUM OS HOST BUILD ENVIRONMENT

export PATH=~/bin:${PATH}:~/depot_tools

# Chromium OS source code
export SOURCE_REPO=~/chromiumos

# repo sync
export REPOFLAGS="-j8"

## END CHROMIUM OS HOST BUILD ENVIRONMENT

## BEGIN CHROMIUM HOST BUILD ENVIRONMENT:

# Chromium source code
CHROMIUM_DIR=~/chromium

## END CHROMIUM HOST BUILD ENVIRONMENT.

# misc
export GIT_DISCOVERY_ACROSS_FILESYSTEMS=true
