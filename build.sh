#!/usr/bin/sh
[-a "$1"] || . settings.sh

$PRIVILEGE_PREFIX "$BUILD_DIRECTORY/aports/scripts/mkimage.sh" --tag "$RELEASE" \
    --arch "$BUILD_ARCHITECTURE" \
    --profile "$PROFILENAME" \
    --repository "https://$APK_REPOSITORY_MIRROR/alpine/$RELEASE/main" \
    --repository "https://$APK_REPOSITORY_MIRROR/alpine/$RELEASE/community" \
    --outdir "$BUILD_DIRECTORY/iso/"
