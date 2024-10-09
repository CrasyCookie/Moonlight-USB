# Settings for the moonlight live iso builder
# Changing these during runtime will result in problems

# General settings
export PROFILENAME="moonlight_usb" # ISO name

# More advanced settings
ARCHITECTURE="x86_64" # Supported architectures: x86 x86_64 armhf armv7 aarch64
RELEASE="3.20" # The alpine release to build off
APK_REPOSITORY_MIRROR="uk.alpinelinux.org" # See mirrors.alpinelinux.org
BUILD_DIRECTORY="/home/build/"
PRIVILEGE_PREFIX="doas" # Examples: doas, sudo, run0
