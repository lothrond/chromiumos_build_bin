#!/bin/bash

set -o errexit

# needs to be in the chroot:
if [ -f /etc/cros_chroot_version ]; then
    if lsblk | grep -q cros >& /dev/null; then
        :
    fi
else
    echo "You Need to be inside the chroot..."
    exit 1
fi

# backup original.
mv ~/.bashrc ~/.bashrc.orig

# setup for chroot:
cp -v ~/bin/etc/skel/chroot.bashrc ~/.bashrc
chmod 600 ~/.bashrc
