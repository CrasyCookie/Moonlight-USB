BOLD="\e[1m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"

error() {
    printf "${RED}[ERROR] %s${RESET}\n" "$1"
    exit 1
}
