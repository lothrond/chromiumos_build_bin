#!/bin/bash

# Go staight into the chroot.
if [ "$(pwd)" != "${SOURCE_REPO}" ]; then
    cd ${SOURCE_REPO}
fi

# Allow passing args to cros_sdk.
if [ $# -ne 0 ]; then
    opt="$@"
fi

cros_sdk --enter $opt
