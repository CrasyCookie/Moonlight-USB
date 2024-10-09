#!/usr/bin/sh

# Source the settings file
. settings.sh

# [S] currently stands for [SCRIPT], to be changed.
case $script_stage in
    1)
        printf "[S] Installing dependencies\n"
        $PRIVILEGE_PREFIX apk add alpine-sdk alpine-conf grub grub-efi grub-bios syslinux \
            xorriso squashfs-tools doas mtools dosfstools
        printf "[S] Making configs"
        mkdir -p /etc/doas.d/
        cat 'permit persist :abuild' >> /etc/doas.d/doas.conf
        printf "[S] Now go add the user 'build' with the password 'build'\n"
        printf "[S] and log into build and run the script as build\n"
        
        ;;
    2)
        printf "[S] Generating keys\n"
        abuild-keygen -i -a
        printf "[S] Cloning aports\n"
        git clone --depth=1 https://gitlab.alpinelinux.org/alpine/aports.git $BUILD_DIRECTORY/aports/
        # If you need to add your own .mkimg and stuff, add it here
        printf "[S] Updating apk repositories\n"
        doas apk update
        mkdir -pv $BUILD_DIRECTORY/tmp && export TMPDIR=$BUILD_DIRECTORY/tmp
        printf "[S] Created tempory directory at $TMPDIR"
        ln aports_scripts/* $BUILD_DIRECTORY/aports/scripts/
        printf "[S] Linked scripts to aports/scripts directory\n"

        ;;
    *)
        printf "[S] Something went wrong, script stage=$script_stage\n"
        printf "[S] If this is the first time running the script this is normal\n"
        printf "[S] Resetting $script_stage\n"
        export script_stage=1
        exit 1
        ;;
esac
export script_stage += 1
