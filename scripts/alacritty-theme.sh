#!/usr/bin/env bash

source $(dirname "$0")/log.sh --source-only

BASE_URL=https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes
TARGET=$HOME/.config/alacritty/themes

download_alacritty_theme() {
  THEME=${1:-oceanic_next}
  mkdir -p $TARGET

  if [[ -f "$TARGET/$THEME.toml" ]]; then
    warn "Alacritty theme already exits; not downloading"
    return
  fi

  curl -LOs --output-dir $TARGET "$BASE_URL/$THEME.toml"
  info "Downloaded Alacritty theme $THEME to $TARGET"
}
