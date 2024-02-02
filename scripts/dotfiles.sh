#!/usr/bin/env bash

ORIGIN=$HOME/git/internal/dotfiles

source $ORIGIN/scripts/log.sh --source-only

function installVimplug() {
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

function addDotfiles() {
  info "Symlink dotfiles"

  ls -1 $ORIGIN/rc | grep -Ev "alacritty|ssh|tmuxinator" | while read -r FILE;
  do
    ln -sf $ORIGIN/rc/$FILE $HOME/.$FILE
    info "Created symlink for $FILE"
  done

  success "Done creating symlink for dotfiles"
}

# The following function is taken from @kradalby's deploy.sh
# https://github.com/kradalby/dotfiles/blob/master/deploy.sh
function addSsh() {
  info "Symlink ssh"

  if [ ! -d $HOME/.ssh ]; then
    mkdir $HOME/.ssh/
  fi

  if [ -f "$HOME/.ssh/config" ]; then
    rm -f $HOME/.ssh/config
    ln -s $ORIGIN/ssh/config $HOME/.ssh/config
  else
    ln -s $ORIGIN/ssh/config $HOME/.ssh/config
  fi
}

function addTmuxinator() {
  info "Symlink tmuxinator"

  if [ ! -d $HOME/.tmuxinator ]; then
    mkdir $HOME/.tmuxinator
  fi

  ls -1 $ORIGIN/tmuxinator/ | while read -r FILE;
  do
    ln -sf $ORIGIN/tmuxinator/$FILE $HOME/.tmuxinator/$FILE
    info "Created symlink for $FILE"
  done
}

function addAlacritty() {
  info "Symlink alacritty config"

  CONFIG_DIR=$HOME/.config/alacritty
  FILE=alacritty.toml

  mkdir -p $CONFIG_DIR
  ln -sf $ORIGIN/rc/alacritty/$FILE $CONFIG_DIR/.$FILE
  info "Created symlink for $FILE"
}

installVimplug

addDotfiles
addSsh
addTmuxinator
addAlacritty
