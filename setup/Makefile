# 
# Chromium OS Makefile

## BEGIN HOST ENVIRONMENT:

HOST_PATH := ~/bin:$(PATH):~/depot_tools
SOURCE_REPO ?= ~/chromiumos
REPOSYNC ?= -j8

## END HOST ENVIRONMENT.

## BEGIN CHROOT ENVIRONMENT:

CHROOT_PATH := ~/bin:$(PATH)
BOARD ?= cyan
IMAGE ?= base
VERITY ?= on

## END CHROOT ENVIRONMENT.

## BEGIN CRYPTMOUNT ENVIRONMENT:

CRYPTDEV ?= /dev/sda
CRYPTMAP ?= crypt
CRYPTHOST ?= /mnt
CRYPTSRC ?= msm255243

## END CRYPTMOUNT ENVIRONMENT.

SETUP_SCRIPTS := setup

.PHONY: setup-host
setup-host: $(SETUP_SCRIPTS)
	source environment/host.sh
	./setup/install_git_and_curl.sh
	./setup/configure_git.sh
	./setup/tweak_sudoers_config.sh
	./setup/install_depot_tools.sh
	#
	# It is up to you to setup gerrit code review!
	# Please See: docs/README-GERRIT
	#
	./setup/source_checkout.sh
	#
	# It is up to you to setup your google API keys!
	# Please see: docs/README-APIKEYS
	#
	# It is up to you to setup authorization for google storage buckets!
	# Please see: docs/README-GSBUCKETS
	#
	./setup/host_env.sh
	./setup/local_mounts.sh
	enter_chroot

.PHONY: setup-chroot
setup-chroot:
	source environment/chroot.sh
	./setup/chroot_env.sh


