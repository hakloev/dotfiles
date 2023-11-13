RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
CLEAR='\033[0m'

info() {
  printf "${CYAN}INFO${CLEAR}: $1\n"
}

warn() {
  printf "${YELLOW}WARN${CLEAR}: $1\n"
}

success() {
  printf "${GREEN}SUCCESS${CLEAR}: $1\n"
}

error() {
  printf "${RED}ERROR${CLEAR}: $1\n"
  exit
}