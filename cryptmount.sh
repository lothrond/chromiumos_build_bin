#!/bin/bash

# If your chromiumos source is located on a different drive,
# (and also encrypted using cryptsetup).

CRYPTDEV=/dev/sda
MAPDEV=moon
MOUNTLOC=/mnt
MOUNT_SOURCE_REPO=msm255243

# Open device
echo "Opening crypt device..."
sudo cryptsetup luksOpen ${CRYPTDEV} ${MAPDEV}

# Mount device
echo "Mounting..."
sudo mount /dev/mapper/${MAPDEV} ${MOUNTLOC}

# link source
#ln -s ${MOUNTLOC}/${MOUNT_SOURCE_REPO} ${SOURCE_REPO}

