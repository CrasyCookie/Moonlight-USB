#!/usr/bin/sh

# Source the settings file
. settings.sh

# [S] currently stands for [SCRIPT], to be changed.
printf "[S] Generating keys\n"
abuild-keygen -i -a
printf "[S] Cloning aports\n"
git clone --depth=1 https://gitlab.alpinelinux.org/alpine/aports.git $BUILD_DIRECTORY/aports/
printf "[S] Updating apk repositories\n"
doas apk update
mkdir -pv $BUILD_DIRECTORY/tmp && export TMPDIR=$BUILD_DIRECTORY/tmp
printf "[S] Created tempory directory at $TMPDIR"
ln aports_scripts/* $BUILD_DIRECTORY/aports/scripts/
printf "[S] Linked scripts to aports/scripts directory\n"
