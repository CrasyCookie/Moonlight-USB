#!/usr/bin/sh

printf "[INFO] Generating keys\n"
abuild-keygen -i -a || printf "[WARN] Failed to generate keys\n"
printf "[INFO] Updating apk repositories\n"
"$PRIVILEGE_PREFIX" apk update || error "failed to update package repositories"
doas mkdir -p "$BUILD_DIRECTORY"/tmp && export TMPDIR="$BUILD_DIRECTORY"/tmp || error "Failed to create temporary directory"
printf "[INFO] Created tempory directory at %s\n" "$TMPDIR"
