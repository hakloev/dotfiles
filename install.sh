#!/bin/sh 

# Add -x after first line for debug mode

for file in bash_profile gitconfig gitexcludes screenrc vimrc zshrc vim; do
    rm -f ~/.$file
    ln -s $PWD/.$file ~/.$file;
done

touch ~/.zsh_history
touch ~/.bash_history

echo "Will now generate ssh-public key"

ssh-keygen

echo "Remember the sudo-command with htop"
