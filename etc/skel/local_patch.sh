
#!/bin/bash

# board name
BOARD=""

# name of package to modify with a patch
PACKAGE_NAME=""

# branch created locally for patching/testing (i.e. LOCAL_BRANCH=test-patch-00)
LOCAL_BRANCH=""

## crosbuild options

# disk image type
# (dev, base, or test)
BUILD_IMAGE="base"

# uncomment for rw access to rootfs
#BUILD_OPTS="-v off"

# This process is intended to test simple changes, on real hardware.

# This function is performed on the local branch ${LOCAL_BRANCH}.
# It is intended for a simple one-lined patch command: (i.e. repo download ..., git pull ..., etc.),
# in order to patch the branch before re-building the image for testing. (See below function)
__mod__() {
    :# Patch line goes here
}

# Building is done using crosbuild.
# As such, additional commands may passed using ${BUILD_OPTS}
# This function itself is not intended to be changed, rather than the options for crosbuild.
# Options are passed using the ${BUILD_OPT} environment viariable (edited above)
__build__() {
    crosbuild -o --image -i ${BUILD_IMAGE} ${BUILD_OPTS} ${BOARD}
}
