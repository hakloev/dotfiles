#!/bin/bash

ORIGIN=~/git/internal/unix-dot

function deploy() {
	ls -1 $ORIGIN/rc/ | while read FILE;

	do
		rm -r ~/.$FILE &> /dev/null
		ln -s $ORIGIN/rc/$FILE ~/.$FILE
		echo "Created symlink for $FILE"
	done
}

# The two following functions is taken from @kradalby's deploy.sh
# https://github.com/kradalby/dotfiles/blob/master/deploy.sh
function deploy_ssh() {
	if [ ! -d $HOME/.ssh ]; then
		mkdir ~/.ssh/
	fi

	if [ -f "$HOME/.ssh/config" ]; then
		rm -f ~/.ssh/config
		ln -s $ORIGIN/ssh/config ~/.ssh/config
	else
		ln -s $ORIGIN/ssh/config ~/.ssh/config
	fi
}

deploy
deploy_ssh