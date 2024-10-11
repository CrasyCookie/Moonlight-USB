#!/usr/bin/sh

# Source the settings file
. settings.sh

error() {
    # \e[?m are colour escape codes
    printf "\e[31m[ERROR] %s\e[0m\n" "$1"
    exit 1
}
# use [ACTION] for things that need to be done by the user
printf "[INFO] Installing dependencies\n"
apk add alpine-sdk alpine-conf grub grub-efi grub-bios syslinux \
    xorriso squashfs-tools doas mtools dosfstools || error "failed to install dependencies"
printf "[INFO] Adding user 'build'\n"
adduser build -DG abuild
printf "build:build" | chpasswd || error "failed to add user or change user password"
printf "[INFO] Creating configs\n"
mkdir -p /etc/doas.d/
echo "permit :abuild\npermit persist :abuild" >> /etc/doas.d/doas.conf || error "Failed to create doas.conf"
printf "[INFO] Changing ownership of git directory to build user"
chown build:abuild "$BUILD_DIRECTORY"
printf "[INFO] Done\n"
