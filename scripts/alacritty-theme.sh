#!/usr/bin/env bash

source $(dirname "$0")/log.sh --source-only

BASE_URL=https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes
TARGET=$HOME/.config/alacritty/themes

download_alacritty_theme() {
  THEME=${1:-oceanic_next}
  mkdir -p $TARGET
  curl -LOs --output-dir $TARGET "$BASE_URL/$theme.toml"
  info "Downloaded Alacritty theme $THEME to $TARGET"
}
