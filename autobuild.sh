#!/bin/bash

## BEGIN DEFAULT CHROMIUM OS BUILD ENVIRONMENT

[ $BOARD ] || BOARD=cyan
[ $IMAGE ] || IMAGE=base
[ $VERITY ] || VERITY=on

## END DEFAULT CHROMIUM OS BUILD ENVIRONMENT

# Needs to be in builddir
check_build_dir() {
    local builddir=~/trunk/src/scripts
    if [ "$(pwd)" != "$builddir" ]; then
        cd $buildir
    fi
}

setup_board() {
    echo -e "\n${colg}>>>${res} Setting up board..."
    ./setup_board --board=${BOARD}
}

build_packages() {
    echo -e "\n${colg}>>>${res} Building packages..."
    ./build_packages --board=${BOARD}
}

build_image() {
    # determine boot verification
    case "$VERITY" in
        on) :;;
        off) __verity__='--noenable-rootfs-verification';;
        *) echo 'Unable to determine $VERITY'; exit 1;;
    esac

    # build
    echo -e "\n${colg}>>>${res} Building image..."
    ./build_image --board=${BOARD} __$verity__ ${IMAGE}
}

flash_image(){
    echo -e "\n${colg}>>>${res} Flashing to usb..."
    cros flash usb://${USBDEV} ../build/images/${BOARD}/latest/chromiumos_${IMAGE}_image.bin
}
