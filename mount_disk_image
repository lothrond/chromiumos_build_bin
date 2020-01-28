#!/bin/bash

if [ "$(pwd)" != "~/trunk/src/scripts" ]; then
    cd ~/trunk/src/scripts
fi

# The preferred way to mount the image you just built to look at its contents.
# If you built a test image, also make sure to add -i chromiumos_test_image.bin.
case "$IMAGE" in
    test) ./mount_gpt_image.sh --board="$BOARD" --safe --most_recent -i chromiumos_test_image.bin;;
    *) ./mount_gpt_image.sh --board="$BOARD" --safe --most_recent;;
esac
