# Variable-based settings for the moonlight iso builder

PROFILENAME="moonlight_usb" # ISO name
BUILD_ARCHITECTURE="x86_64" # Supported architectures: x86 x86_64 armhf armv7 aarch64
RELEASE="edge" # The alpine release to build off
APK_REPOSITORY_MIRROR="uk.alpinelinux.org" # See mirrors.alpinelinux.org
BUILD_DIRECTORY="$(dirname "$(realpath $0)")/"
PRIVILEGE_PREFIX="doas" # doas, sudo, run0 etc
