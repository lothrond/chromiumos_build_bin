#!/bin/bash

set -o errexit

# The cros_sdk command supports mounting additional directories into your chroot environment.
# This can be used to share editor configurations, a directory full of recovery images, etc.
# You can create a src/scripts/.local_mounts file listing all the directories (outside of the chroot)
# that you'd like to access inside the chroot.

CHROMIUMOS_CHROOT_SHARE_FILE=${SOURCE_REPO}/src/scripts/.local_mountfs

if [ ! -f ${CHROMIUMOS_CHROOT_SHARE_FILE} ]; then
    touch ${CHROMIUM_CHROOT_SHARE_FILE}
fi

# Each line of .local_mounts refers to a directory you'd like to mount, and where you'd like it mounted.
# If there is only one path name, it will be used as both the source and the destination directory. If
# there are two paths listed on one line, the first is considered to be the path OUTSIDE the chroot and
# the second will be the path INSIDE the chroot.  The source directory must exist; otherwise, cros_sdk
# will give off an ugly python error and fail to enter the chroot.
# (Note: For security and safety reasons, all directories mounted via .local_mounts will be read-only.)
echo "/home/$(whoami)/bin" > ${CHROMIUM_CHROOT_SHARE_FILE}

