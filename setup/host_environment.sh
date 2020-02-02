#!/bin/bash

set -o errexit

# needs to be outside chroot.
if [ -f /etc/cros_chroot_version ]; then
    if lsblk | grep -q cros >& /dev/null; then
        echo "You Need to be outside the chroot..."; exit 1
    fi
fi

# backup original:
mv ~/.profile ~/.profile.orig

# setup for host user:
cp -v ~/bin/etc/skel/host.profile ~/.profile
chmod 600 ~/.profile
