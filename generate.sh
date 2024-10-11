#!/usr/bin/sh
. funcs.sh
. settings.sh

printf "${BOLD}Legend:${RESET}\n${BLUE}Blue${RESET}=metascript info\n${RED}Red${RESET}=execution error\n"

printf "${BLUE}[INFO] Preparing${RESET}\n"
. generate_start.sh || error "Failed to source generate_start.sh"

# Might add heredocs instead.
printf "${BLUE}[INFO] Running the rest as the build user${RESET}\n"
su build '. generate_end.sh || error "Failed to source generate_end.sh"'

printf "${BLUE}[INFO] Building the ISO${RESET}\n"
su build '. build.sh || error "Failed to source build.sh"'
