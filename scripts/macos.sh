#!/usr/bin/env bash

source $(dirname "$0")/log.sh --source-only

function set_hostname() {
  read -p 'Hostname: ("" to skip): ' hostname

  if [ -z "$hostname" ]; then
    warn 'Will not set hostname'
    return
  fi

  sudo scutil --set HostName $hostname
  sudo scutil --set LocalHostName $hostname
  sudo scutil --set ComputerName $hostname

  success "Successfully set hostname to '$hostname'"
}

function set_screenshot_dir() {
  screenshot_dir=$HOME/Desktop/Screenshots
  mkdir -p $screenshot_dir/{iOS,macOS}
  defaults write com.apple.iphonesimulator ScreenShotSaveLocation "$screenshot_dir/iOS"
  defaults write com.apple.screencapture location "$screenshot_dir/macOS"
}

function setDefaults() {
  sudo defaults write -g InitialKeyRepeat -int 10
  sudo defaults write -g KeyRepeat -int 1
}

sudo -v

set_hostname
set_screenshot_dir
setDefaults

info 'Install Xcode Developer Tools'
xcode-select --install

info "Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(cd $HOME/git/internal/dotfiles/requirements && brew bundle install) # temporary move to './requirements' and run 'brew bundle'
