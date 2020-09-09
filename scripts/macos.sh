#!/usr/bin/env bash

echo 'Install Xcode developer tools'
xcode-select --install

# Check for homebrew
if test ! $(which brew); then
    echo "Installing Homebrew"
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "Homebrew already installed, skipping install"
fi

sudo -v

screenshot_dir=$HOME/Desktop/Screenshots

mkdir -p $screenshot_dir/{iOS,macOS}

defaults write com.apple.iphonesimulator ScreenShotSaveLocation "$screenshot_dir/iOS"
defaults write com.apple.screencapture location "$screenshot_dir/macOS"

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
