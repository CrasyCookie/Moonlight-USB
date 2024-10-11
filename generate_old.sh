#!/usr/bin/sh

# Source the settings file
. settings.sh

# [S] currently stands for [SCRIPT], to be changed.
printf "[S] Installing dependencies\n"
$PRIVILEGE_PREFIX apk add alpine-sdk alpine-conf grub grub-efi grub-bios syslinux \
xorriso squashfs-tools doas mtools dosfstools
printf "[S] Making configs\n"
mkdir -p /etc/doas.d/
cat 'permit persist :abuild' >> /etc/doas.d/doas.conf
adduser build -DG abuild
printf "build:build" | chpasswd
su build -c <<EOF
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
EOF
printf "[S] Fully done\n"
