#!/usr/bin/env bash

sudo -v

screenshot_dir=$HOME/Desktop/Screenshots

mkdir -p $screenshot_dir/{iOS,macOS}

defaults write com.apple.iphonesimulator ScreenShotSaveLocation "$screenshot_dir/iOS"
defaults write com.apple.screencapture location "$screenshot_dir/macOS"

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

echo 'Install Xcode developer tools'
xcode-select --install
