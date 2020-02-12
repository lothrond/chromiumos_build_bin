chromiumos_build_bin
====================

Chromium OS build helper scripts.

Manual Setup
------------

Start by cloning this repository into ~/bin:

     $ git clone https://github.com/lothrond/chromiumos_build_bin ~/bin

Change into it:

    $ cd ~/bin

Source build environment for host:

    $ source environment/host.sh

To automatic source host environment on login, run:

    $ ./setup/host_environment.sh

Install git and curl (and lvm tools):

    $ ./setup/install_git_and_curl.sh

Configure git:
  
    $ ./setup/configure_git.sh

Tweak the sudoers config file:

    $ ./setup/tweak_sudoers_config.sh

Install depot_tools:

    $ ./setup/install_depot_tools.sh

Setup gerrit code review, (__see docs/README-GERRIT__).

Get the source code:

    $ ./setup/source_checkout.sh

Setup google API keys, (__see docs/README-APIKEYS__).
 
### Do one of the following:

* option a -- Supply API keys in ~/.googleapikeys (HOST)
* option b -- Supply API keys at runtime in /etc/chrome_dev.conf (DUT)

#### option 'a' needs to be done before running `cros_sdk` on the host system.
#### option 'b' requires r/w access on the dut device.

Setup authorization for google storage buckets, (__see docs/README-GSBUCKETS__).

---

Manual Build
------------

Share directories with the chroot, (see docs/README-SHARING):

    $ ./setup/local_mounts.sh

#### (After running this command, you should have ~/bin inside of your chroot.)

Create chroot:

    $ cd ${SOURCE_REPO} && cros_sdk

#### ** This will take some time.

When the previous command finishes, you should now be in the chroot, indicated with
a bash prompt:

    (cr) $

#### (The rest of this document assumes you are in the chroot.)

Inside the chroot:

* Select your board (__see docs/README-BOARDS__)
* Select your disk image build (__test/dev/base__)
* Select verified boot mode (__on/off__)

    (cr) $ export BOARD=cyan
    (cr) $ export IMAGE=test
    (cr) $ export VERITY=off
OR

Source ENVIRONMENT for chroot:

    (cr) source ~/bin/environment/chroot.sh

### (This will only work after running ./setup/local_mounts.sh)

#### This repository defaults to building base images, with verified boot, for cyan boards.
#### If you would like to build for another board, you will need to modify environment/chroot.sh 
#### before buidling the image.

To automatic source chroot environment on entry, run:

    (cr) ~/bin/setup/chroot_environment.sh

Build a new Chromium OS disk image:

    (cr) $ build_new

Flash the disk image on to a usb stick.

    (cr) $ flash_usb

### WARNING: this will of course format the usb stick**

---

Testing
--------

### (Make sure you are in this directory):

Mount:

    (cr) $ ./mount_disk_image

(Test)

Unmount:

    (cr) $ ./unmount_disk_image

---

Installation
------------

### Make sure the Chrome OS device is in developer mode (see docs/README-DEVMODE).

---

#### Note: You will still be able to recover Chome OS with recovery media.

This tutorial assumes you are currently in a normal Chrome OS device.

* Start by backing up, etc.
* Then, make sure all external devices, usbs, sd, etc., are all unmounted and removed.

---

Put the device in recovery mode:

    [esc]+[refresh] + [power]

From recovery mode, put the device in developer mode:

    [ctrl]+[d]

#### **WARNING: This is going to wipe your disk**

This will format your device, then reboot to recovery. The default timeout is 30 seconds.

Let the recovery timeout, or try pressing: `[ctrl]+[d]` to boot into developer mode. 

You should now be on the setup screen. From this screen just switch to a tty with:

    [ctrl]+[alt]+[f2] (the forward button)

You should now be in tty2. Login as chronos (you should not need a password).

To be able to boot from usb media run:

    sudo crossystem dev_boot_usb=1

Reboot to to recovery and Plugin usb.

This time, press: `[ctrl]+[u]` to boot from usb media.

### (Chromium boot splash...)

Repeat step 4.

Login as the shared user chronos, and supply your password.

Install Chromium OS onto device:

    sudo /usr/sbin/chromeos-install

#### (Press y if you agree)

This will not take very long. 
After this is done, i believe the rest should be self explanitory...

---

Manual Updating:
----------------

### (This assumes no personal modifications have been applied to the source code.)

After a manual setup is complete, and having done at lest one manual build,
a basic update would be as follows:

* Sync sources
* Enter build chroot
* Build packages
* Build disk image
* Flash disk image

Sync sources:

    $ sync_sources

Enter build chroot:

    $ start_chroot

Build_packages, build disk image:

    $ build

Flash disk image:

    $ flash_usb

---

Extras:
-------

Making changes: (__see docs/README-MODIFYING__)

Storing sources on a seperate encrypted disk: (__see docs/README-ENVIRONMENT__)

### (more to come)
