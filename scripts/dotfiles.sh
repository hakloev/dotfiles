#!/usr/bin/env bash

ORIGIN=$HOME/git/internal/dotfiles

function deploy() {
	ls -1 $ORIGIN/rc/ | while read -r FILE;
	do
		rm -r $HOME/.$FILE &> /dev/null
		ln -s $ORIGIN/rc/$FILE $HOME/.$FILE
		echo "Created symlink for $FILE"
	done
}

# The two following functions is taken from @kradalby's deploy.sh
# https://github.com/kradalby/dotfiles/blob/master/deploy.sh
function deploy_ssh() {
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

function deploy_nvim() {
  mkdir -p $HOME/.config

  if [ -f "$HOME/.config/nvim" ]; then
    rm -f $HOME/.config/nvim
    ln -s $ORIGIN/nvim $HOME/.config
  else
    ln -s $ORIGIN/nvim $HOME/.config
  fi
}

function install_vimplug() {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

deploy
deploy_ssh
deploy_nvim
install_vimplug
