#!/usr/bin/sh

# Source the settings file if not being sourced (debug stuff)
[-n "$1"] || . settings.sh; . funcs.sh

error() {
    # \e[?m are colour escape codes
    printf "\e[31m[ERROR] %s\e[0m\n" "$1"
    exit 1
}
# Use [ACTION] for things that have to be done
printf "[INFO] Generating keys\n"
abuild-keygen -i -a || printf "[WARN] Failed to generate keys\n"
#if [ ! -d "$BUILD_DIRECTORY"/aports ]; then
#    printf "[WARN] A minimal version of aports should be installed, but isn't installed\n"
#    printf "[INFO] Cloning aports, this might take a while\n"
#    git clone --depth=1 "https://gitlab.alpinelinux.org/alpine/aports.git" "$BUILD_DIRECTORY"/aports/ || error "failed to clone aports"
#fi
printf "[INFO] Updating apk repositories\n"
"$PRIVILEGE_PREFIX" apk update || error "failed to update package repositories"
doas mkdir -p "$BUILD_DIRECTORY"/tmp && export TMPDIR="$BUILD_DIRECTORY"/tmp || error "Failed to create temporary directory"
printf "[INFO] Created tempory directory at %s\n" "$TMPDIR"
#ln aports_scripts/* "$BUILD_DIRECTORY"/aports/scripts/ || error "Linking scripts failed"
#printf "[INFO] Linked scripts to aports/scripts directory\n"
printf "[INFO] Done\n"
