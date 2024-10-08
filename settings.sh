# Settings for the moonlight live iso builder
# General settings
export PROFILENAME = "moonlight_usb" # Name of the ISO

# More advanced settings
ARCHITECTURE = "x86_64" # Supported architectures: x86 x86_64
RELEASE = "edge" # The alpine release to build off
BUILD_DIRECTORY = "/home/build/"
PRIVILEGE_PREFIX = "doas" # Examples: doas, sudo, run0
