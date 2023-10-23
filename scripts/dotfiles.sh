#!/usr/bin/env bash

ORIGIN=$HOME/git/internal/dotfiles

function dotfiles() {
	ls -1 $ORIGIN/rc/ | while read -r FILE;
  do
		rm -f $HOME/.$FILE &> /dev/null
		ln -s $ORIGIN/rc/$FILE $HOME/.$FILE
		echo "Created symlink for $FILE"
	done
}

# The two following functions is taken from @kradalby's deploy.sh
# https://github.com/kradalby/dotfiles/blob/master/deploy.sh
function add_ssh() {
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

function add_tmuxinator() {
  if [ ! -d $HOME/.tmuxinator ]; then
    mkdir $HOME/.tmuxinator
  fi

  ls -1 $ORIGIN/tmuxinator/ | while read -r FILE;
  do
    rm -f $HOME/.tmuxinator/$FILE &> /dev/null
    ln -s $ORIGIN/tmuxinator/$FILE $HOME/.tmuxinator/$FILE
    echo "Created symlink for $FILE"
  done
}

function install_vimplug() {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

dotfiles
add_ssh
add_tmuxinator
install_vimplug
