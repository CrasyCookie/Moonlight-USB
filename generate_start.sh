#!/usr/bin/sh

# Source the settings file
. settings.sh

# [S] currently stands for [SCRIPT], to be changed.
printf "[S] Installing dependencies\n"
$PRIVILEGE_PREFIX apk add alpine-sdk alpine-conf grub grub-efi grub-bios syslinux \
xorriso squashfs-tools doas mtools dosfstools
printf "[S] Making configs\n"
adduser build -DG abuild
printf "build:build" | chpasswd
$PRIVLEGE_PREFIX mkdir -p /etc/doas.d/
$PRIVLEGE_PREFIX cat 'permit persist :abuild' > /etc/doas.d/doas.conf
