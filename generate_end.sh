#!/usr/bin/sh

# Source the settings file
. settings.sh

error() {
    # \e[?m are colour escape codes
    printf "\e[31m[ERROR] %s\e[0m\n" "$1"
    exit 1
}
# Use [ACTION] for things that have to be done
printf "[INFO] Generating keys\n"
abuild-keygen -i -a || printf "[WARN] Failed to generate keys\n"
printf "[INFO] Cloning aports, this might take a while\n"
if [ ! -d "$BUILD_DIRECTORY"/aports ]; then
    git clone --depth=1 "https://gitlab.alpinelinux.org/alpine/aports.git" "$BUILD_DIRECTORY"/aports/ || error "failed to clone aports"
fi
printf "[INFO] Updating apk repositories\n"
apk update || error "failed to update package repositories"
mkdir -pv "$BUILD_DIRECTORY"/tmp && export TMPDIR="$BUILD_DIRECTORY"/tmp
printf "[INFO] Created tempory directory at %s\n" "$TMPDIR"
"$PRIVELEGE_PREFIX" ln aports_scripts/* "$BUILD_DIRECTORY"/aports/scripts/ || error "Linking scripts failed"
printf "[INFO] Linked scripts to aports/scripts directory\n"
printf "[INFO] Done\n"
