#!/usr/bin/env bash

echo "Update Brew"
brew update
brew upgrade

echo "Install essentials from Brew"
brew install wget
brew install git
brew install fish
brew install openssl
brew install tmux
brew install nodejs
brew install mosh
brew install sqlite
brew install python3
brew install tree
brew install unrar
brew install vim

brew cleanup