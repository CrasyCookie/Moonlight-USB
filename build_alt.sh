#!/usr/bin/sh
set -exv
. settings.sh

# Debugging output to ensure variables are set correctly
echo "Using settings:"
echo "BUILD_DIRECTORY: '$BUILD_DIRECTORY'"
echo "RELEASE: '$RELEASE'"
echo "BUILD_ARCHITECTURE: '$BUILD_ARCHITECTURE'"
echo "PROFILENAME: '$PROFILENAME'"
echo "APK_REPOSITORY_MIRROR: '$APK_REPOSITORY_MIRROR'"

# Check if all required variables are non-empty
if [ -z "$BUILD_DIRECTORY" ] || [ -z "$RELEASE" ] || [ -z "$BUILD_ARCHITECTURE" ] || \
   [ -z "$PROFILENAME" ] || [ -z "$APK_REPOSITORY_MIRROR" ]; then
    echo "Error: One or more required variables are empty."
    exit 1
fi

# Ensure the build directory exists
#if [ ! -d "$BUILD_DIRECTORY" ]; then
#    echo "Error: BUILD_DIRECTORY '$BUILD_DIRECTORY' does not exist."
#    exit 1
#fi

# Navigate to the build directory
#cd "$BUILD_DIRECTORY"

# Run mkimage.sh with all validated parameters
#"$BUILD_DIRECTORY/aports/scripts/mkimage.sh"
"$BUILD_DIRECTORY/aports/scripts/mkimage.sh" --tag "$RELEASE" \
    --arch "$BUILD_ARCHITECTURE" \
    --profile "$PROFILENAME" \
    --repository "https://$APK_REPOSITORY_MIRROR/alpine/$RELEASE/main" \
    --repository "https://$APK_REPOSITORY_MIRROR/alpine/$RELEASE/community" \
    --outdir "$BUILD_DIRECTORY/iso/"

