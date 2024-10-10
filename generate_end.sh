#!/usr/bin/sh

# Source the settings file
. settings.sh

error() {
    printf "[ERROR] %s" "$1"
    exit 1
}
# Use [ACTION] for things that have to be done
printf "[INFO] Generating keys\n"
abuild-keygen -i -a || printf "[WARN] Failed to generate keys"
printf "[INFO] Cloning aports\n"
git clone --depth=1 https://gitlab.alpinelinux.org/alpine/aports.git "$BUILD_DIRECTORY"/aports/ || error "failed to clone aports"
printf "[INFO] Updating apk repositories\n"
"$PRIVELEGE_PREFIX" apk update || error "Package update failed"
mkdir -pv "$BUILD_DIRECTORY"/tmp && export TMPDIR="$BUILD_DIRECTORY"/tmp
printf "[INFO] Created tempory directory at %s\n" "$TMPDIR"
"$PRIVELEGE_PREFIX" ln aports_scripts/* "$BUILD_DIRECTORY"/aports/scripts/ || error "Linking scripts failed"
printf "[INFO] Linked scripts to aports/scripts directory\n"
printf "[INFO] Done"
