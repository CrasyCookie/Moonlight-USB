#!/usr/bin/sh

# Source the settings file
[-n "$1"] || . settings.sh; . funcs.sh

# use [ACTION] for things that need to be done by the user
printf "[INFO] Installing dependencies\n"
apk add alpine-sdk alpine-conf grub grub-efi grub-bios syslinux \
    xorriso squashfs-tools doas mtools dosfstools || error "failed to install dependencies"
printf "[INFO] Adding user 'build'\n"
adduser build -DG abuild
printf "build:build" | chpasswd || error "failed to add user or change user password"
printf "[INFO] Creating configs\n"
mkdir -p /etc/doas.d/
echo -e "permit :abuild\npermit persist :abuild" >> /etc/doas.d/doas.conf || error "Failed to create doas.conf"
printf "[INFO] Changing ownership of git directory to build user"
chown build:abuild "$BUILD_DIRECTORY"
printf "[INFO] Done\n"
