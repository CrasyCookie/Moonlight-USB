#!/usr/bin/sh
. funcs.sh
. settings.sh

printf "${BOLD}Legend:${RESET}\n${BLUE}Blue=metascript info\n${RED}Red=execution error${RESET}\n"

printf "${BLUE}[INFO] Preparing${RESET}\n"
. generate_start.sh "sourced" || error "Failed to source generate_start.sh"

printf "${BLUE}[INFO] Running the rest as the build user${RESET}\n"
su build; . generate_end.sh "sourced" || error "Failed to source generate_end.sh"

printf "${BLUE}[INFO] Building the ISO${RESET}\n"
su build; . build.sh "sourced" || error "Failed to source build.sh"
