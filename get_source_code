#!/bin/bash

# Needs chromiumos source code.
[ $SOURCE_REPO ] || { echo 'missing $SOURCE_REPO'; exit 1 ;}

# Default repo ENVIRONMENT.
[ $REPOFLAGS ] || REPOFLAGS="-j4"

# Create a directory to hold the source, "${SOURCE_REPO}".
# (This should not be installed on a remote NFS directory.)
if [ ! -d $SOURCE_REPO ]; then
    mkdir -p $SOURCE_REPO
fi

cd $SOURCE_REPO

# Initialize branch.
# Chromium OS uses repo to sync down source code. repo is a wrapper for the git that helps deal with a large
# number of git repositories. (repo is installed with depot_tools).
repo init -u https://chromium.googlesource.com/chromiumos/manifest.git \
    --repo-url https://chromium.googlesource.com/external/repo.git

# Optional: Make any changes to .repo/local_manifests/local_manifest.xml before syncing
#...

# Sync repository.
# repo can concurrently sync multiple repositories at once. You can adjust the number based on how fast your
# internet connection is. For the initial sync, it's generally requested that you use no more than 8 concurrent jobs.
# (For later syncs, when you already have the majority of the source local, using -j16 or so is generally okay.)
repo sync $REPOFLAGS

exit $?
