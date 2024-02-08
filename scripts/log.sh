#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
CLEAR='\033[0m'

level() {
  printf "%b%-9s${CLEAR} - %s\n" "$2" "[$1]" "$3"
}

info() {
  level INFO $CYAN "$1"
}

warn() {
  level WARN $YELLOW "$1"
}

success() {
  level SUCCESS $GREEN "$1"
}

error() {
  level ERROR $RED "$1"
  exit
}
