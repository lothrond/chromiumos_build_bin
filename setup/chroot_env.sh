#!/bin/bash

echo "Setting up bashrc for chroot user..."

# needs chroot
inside_chroot() {
    if [ -f /etc/cros_chroot_version ]; then
        if lsblk | grep -q cros >& /dev/null; then
            return 0
        fi
    fi
    return 1
}

if ! inside_chroot; then
    echo "You Need to be inside the chroot..."
    exit 1
fi

# backup original
mv ~/.bashrc ~/.bashrc.orig

# setup ~/.bashrc for chroot
cp -v ~/bin/environment/chroot.bashrc ~/.bashrc
chmod 600 ~/.bashrc
