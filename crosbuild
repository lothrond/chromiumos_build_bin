#!/bin/bash
#
# Copyright (C) 2020, Mike Moss <msm255243@gmail.com>
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Needs user (not root).
if [ $UID -eq 0 ]; then
    echo "Do not run as root..."; exit 1
fi

# Needs Chromium OS build ENVIRONMENT for chroot.
if ! echo "${BOARD} ${IMAGE} ${VERITY}" > /dev/null; then
    echo "Needs ENVIRONMENT..."; exit 1
fi

# Check board name.
if ! check_board "${BOARD}"; then
    echo "Checking board failed..."; exit 1
fi

# Check build image type.
case ${IMAGE} in
    test) :;;
    dev) :;;
    base) :;;
    *) echo "Failed to determine build image..."; exit 1;;
esac

# Check verified boot status.
if [ "$VERITY" == "off" ]; then
    __verity__="--noenable_rootfs_verification"
fi

# colors
colg="\e[32m"
res="\e[0m"

# Print ENVIRONMENT.
echo
echo -e "${colg}*${res} BOARD:  ${BOARD}"
echo -e "${colg}*${res} IMAGE:  ${IMAGE}"
echo -e "${colg}*${res} VERITY: ${VERITY}"
echo

# (You should be in the ~/trunk/src/scripts directory).
if [ "$(pwd)" != "~/trunk/src/scripts" ]; then
    cd ~/trunk/src/scripts
fi

# Setup new build/board and password (only needed once).
if [ $# -eq 1 ]; then
    if [ "$1" == "-new" ] || [ "$1" == "-force" ]; then
        if [ "$1" == "-force" ]; then
            flag="--force"
        fi
    fi
    ./setup_board --board=${BOARD} "$@"
    ./set_shared_user_password.sh
else
    echo "USAGE: $(basenmae $0) [-new] [-force]"
fi

# Build packages and disk image.
./build_packages --board=${BOARD}
./build_image --board=${BOARD} ${__verity__} ${IMAGE}

exit $?
