#!/bin/bash

## BEGIN CHROMIUM OS BUILD ENVIRONMENT

export PATH=~/bin:${PATH}:~/depot_tools
export SOURCE_REPO=~/chromiumos
export REPOSYNC="-j8"

## END CHROMIUM OS BUILD ENVIRONMENT

## BEGIN CHROMIUM BUILD ENVIRONMENT:

CHROMIUM_DIR=~/chromium

## END CHROMIUM BUILD ENVIRONMENT.

# misc
#export GIT_DISCOVERY_ACROSS_FILESYSTEMS=true
