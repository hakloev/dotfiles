#!/bin/bash

ORIGIN=~/git/internal/unix-dot

function deploy() {
	ls -1 $ORIGIN/dotfiles/ | while read FILE;

	do
		rm -r ~/.$FILE &> /dev/null
		ln -s $ORIGIN/dotfiles/$FILE ~/.$FILE
		echo "Created symlink for $FILE"
	done

}

# The two following functions is taken from @kradalby's deploy.sh
# https://github.com/kradalby/dotfiles/blob/master/deploy.sh
function deploy_ssh() {
	if [ ! -d $HOME/.ssh ]; then
		mkdir ~/.ssh/
	fi

	if [ -f $HOME/.ssh/config ]; then
		rm ~/.ssh/config
		ln -s $ORIGIN/ssh/config ~/.ssh/config
	else
		ln -s $ORIGIN/ssh/config ~/.ssh/config
	fi
}

function install_vimplug() {
	mkdir -p ~/.vim/autoload
	curl --silent -fLo ~/.vim/autoload/plug.vim \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

deploy
deploy_ssh
# install_vimplug
