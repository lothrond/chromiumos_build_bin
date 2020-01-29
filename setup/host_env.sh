#!/bin/bash

echo "Setting up profile for host user..."

# needs to be outside chroot
inside_chroot() {
    if [ -f /etc/cros_chroot_version ]; then
        if lsblk | grep -q cros >& /dev/null; then
            return 0
        fi
    fi
    return 1
}

if inside_chroot; then
    echo "You Need to be outside the chroot..."
    exit 1
fi

# backup original
mv ~/.profile ~/.profile.orig

# setup ~/.profile for host user
cp -v ~/bin/environment/host.profile ~/.profile
chmod 600 ~/.profile
