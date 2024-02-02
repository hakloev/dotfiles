#!/usr/bin/env bash

ORIGIN=$HOME/git/internal/dotfiles

source $ORIGIN/scripts/log.sh --source-only

function installPrezto() {
  read -r -p "Install Prezto? [yY/n] " -n 1 choice
  echo
  case $choice in
    [yY])
      git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
      success "Installed Prezto"
      ;;
    *)
      warn "Skipping Prezto"
      ;;
  esac
}

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

  ls -1 $ORIGIN/rc/ | while read -r FILE;
  do
    rm -f $HOME/.$FILE &> /dev/null
    ln -s $ORIGIN/rc/$FILE $HOME/.$FILE
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

  success "Done creating symlink for ssh"
}

function addTmuxinator() {
  info "Symlink tmuxinator"

  if [ ! -d $HOME/.tmuxinator ]; then
    mkdir $HOME/.tmuxinator
  fi

  ls -1 $ORIGIN/tmuxinator/ | while read -r FILE;
  do
    rm -f $HOME/.tmuxinator/$FILE &> /dev/null
    ln -s $ORIGIN/tmuxinator/$FILE $HOME/.tmuxinator/$FILE
    info "Created symlink for $FILE"
  done

  success "Done creating symlink for tmuxinator"
}

installPrezto
installVimplug

addDotfiles
addSsh
addTmuxinator
