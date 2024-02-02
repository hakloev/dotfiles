#!/usr/bin/env bash

source $(dirname "$0")/log.sh --source-only
source $(dirname "$0")/alacritty-theme.sh --source-only

ORIGIN=$HOME/git/internal/dotfiles

function install_vimplug() {
  read -r -p "Install vimplug? [yY/n] " -n 1 choice
  echo
  case $choice in
    [yY])
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      success "Installed vimplug"
      ;;
    *)
      warn "Skipping vimplug"
      ;;
  esac
}

function add_dotfiles() {
  info "Symlink dotfiles"

  IGNORED_FOLDERS="alacritty|ssh|tmuxinator"

  ls -1 $ORIGIN/rc | grep -Ev $IGNORED_FOLDERS | while read -r FILE;
  do
    ln -sf $ORIGIN/rc/$FILE $HOME/.$FILE
    info "Created symlink for $FILE to $HOME/.$FILE"
  done

  success "Done creating symlink for dotfiles"
}

# The following function is taken from @kradalby's deploy.sh
# https://github.com/kradalby/dotfiles/blob/master/deploy.sh
function add_ssh() {
  info "Symlink ssh folder"

  CONFIG_DIR=$HOME/.ssh
  FILE=config

  mkdir -p $CONFIG_DIR
  ln -sf $ORIGIN/rc/ssh/$FILE $CONFIG_DIR/$FILE
  info "Created symlink for $FILE to $CONFIG_DIR"
}

function add_tmuxinator() {
  info "Symlink tmuxinator folder"

  CONFIG_DIR=$HOME/.tmuxinator

  mkdir -p $CONFIG_DIR
  ls -1 $ORIGIN/rc/tmuxinator | while read -r FILE;
  do
    ln -sf $ORIGIN/rc/tmuxinator/$FILE $CONFIG_DIR/$FILE
    info "Created symlink for tmuxinator project $FILE to $CONFIG_DIR"
  done
}

function add_alacritty() {
  info "Symlink alacritty folder"

  CONFIG_DIR=$HOME/.config/alacritty
  FILE=alacritty.toml

  mkdir -p $CONFIG_DIR
  ln -sf $ORIGIN/rc/alacritty/$FILE $CONFIG_DIR/$FILE
  info "Created symlink for $FILE to $CONFIG_DIR"
}

install_vimplug

add_dotfiles
add_ssh
add_tmuxinator
add_alacritty
download_alacritty_theme oceanic_next
