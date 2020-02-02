#!/bin/bash

if [ "$(pwd)" != "${SOURCE_REPO}" ]; then
    cd ${SOURCE_REPO}
fi

echo "Cleaning up chroot..."
cros_sdk --unmount
