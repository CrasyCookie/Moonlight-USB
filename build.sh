#!/usr/bin/sh
. settings.sh
/home/build/aports/scripts/mkimage.sh --tag $RELEASE \
    --arch $BUILD_ARCHITECTURE \
    --profile $PROFILENAME
    --repository "https://$REPOSITORY_MIRROR/alpine/$RELEASE/main" \
    --repository "https://$REPOSITORY_MIRROR/alpine/$RELEASE/community" \
    --outdir "$BUILD_DIRECTORY/iso/"
