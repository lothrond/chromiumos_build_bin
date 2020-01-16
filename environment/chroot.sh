#!/bin/bash

## BEGIN CHROMIUM OS BUILD CHROOT ENVIRONMENT

export PATH=~/bin:${PATH}

# board name
export BOARD=cyan

# build image
export IMAGE=test

# verified boot
export VERITY=off

## END CHROMIUM OS BUILD CHROOT ENVIRONMENT
