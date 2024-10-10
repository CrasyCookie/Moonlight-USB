#!/usr/bin/sh
. settings.sh
cd "$BUILD_DIRECTORY" || exit 1
"$BUILD_DIRECTORY"/aports/scripts/mkimage.sh --tag "$RELEASE" \
    --arch "$ARCHITECTURE" \
    --profile "$PROFILENAME" \
    --repository "https://$APK_REPOSITORY_MIRROR/alpine/$RELEASE/main" \
    --repository "https://$APK_REPOSITORY_MIRROR/alpine/$RELEASE/community" \
    --outdir "$BUILD_DIRECTORY/iso/"
