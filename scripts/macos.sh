#!/usr/bin/env bash

echo 'Install Xcode developer tools'
xcode-select --install

# Check for homebrew
if test ! $(which brew); then
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed, skipping install"
fi

# Update homebrew
sh requirements/brew.sh

