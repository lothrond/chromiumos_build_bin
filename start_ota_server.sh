#!/bin/bash

# dev_server runtime option
devopt="start_devserver --port ${DEVSERVER_PORT}"

# verify chroot
in_chroot() {
    if [ -f /etc/cros_chroot_version ]; then
        if lsblk | grep -q cros >& /dev/null; then
            return 0
        fi
    fi
    return 1
}

# If already inside the chroot, start the server.
# Otherwise, enter the chroot first.
if in_chroot; then
    ${devopt}
else
    # needs to be in source repo
    if [ "$(pwd)" != "${SOURCE_REPO}" ]; then 
        cd ${SOURCE_REPO}
    fi
    enter_chroot ${devopt}
fi