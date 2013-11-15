#!/bin/sh 

# Add -x after first line for debug mode

for file in bash_profile gitconfig gitexcludes screenrc vimrc zshrc; do
    rm -f ~/.$file
    ln -s $PWD/$file ~/.$file;
done

touch ~/.zsh_history
touch ~/.bash_history

echo "Installed all dot-files, but did not move .git and .vim"
echo "Will now generate ssh-public key"

ssh-keygen
