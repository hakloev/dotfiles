#!/usr/bin/env bash

cd $HOME/git/internal/dotfiles

source $(dirname "$0")/log.sh --source-only

read -r -p "Link dotfiles? [yY/n] " -n 1 choice
echo
case $choice in
  [yY])
    sh scripts/dotfiles.sh
    ;;
  *)
    warn "Skipping dotfiles"
    ;;
esac

read -r -p "Install pip3 requirements? [yY/n] " -n 1 choice
echo
case $choice in
  [yY])
    info "Installing pip3 requirements"
    pip3 install --user -r requirements/pip3.txt
    success "Done installing pip3 requirements"
    ;;
  *)
    warn "Skipping pip3 requirements"
    ;;
esac

case `uname` in
  Darwin)
    info "Run macOS configuration script"
    sh scripts/macos.sh

    if [ $? -eq 0 ]; then
      success "macOS dependencies installed"
    else
      warn "Failed to install macOS dependencies"
    fi
  ;;
esac

success "Done bootstraping"
