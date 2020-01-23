#!/bin/bash

## BEGIN CHROMIUM OS BUILD CHROOT ENVIRONMENT

export PATH=~/bin:${PATH}

# board name
export BOARD=cyan

# build image
export IMAGE=base

# verified boot
export VERITY=on

## END CHROMIUM OS BUILD CHROOT ENVIRONMENT
