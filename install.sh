#!/bin/sh 

function installDot {
    echo "##################################################"
    echo "############ INSTALLING DOTFILES #################"
    echo "##################################################"
    echo 

    for file in bash_profile gitconfig gitexcludes screenrc vimrc zshrc vim; do
        rm -f ~/.$file
        ln -s $PWD/.$file ~/.$file;
        echo "Symlinked $file"
    done

    touch ~/.zsh_history
    touch ~/.bash_history
    
    echo
    echo "Dotfiles symlinked"
    echo

    echo -n "Do you want to generate ssh-public key? [y/n]: "
    read answer
    echo

    if [ $answer == "y" ]; then
        echo "Okey, will now generate ssh-public key"
        ssh-keygen
    else 
        echo "Okey, will not generate ssh-public key"
    fi

    if [ $OSTYPE == "darwin13.0" ]; then
        echo "Remember the sudo-command with htop"
    fi

    echo
    echo "##################################################" 
    echo "#################### DONE ########################"
    echo "##################################################"
}

installDot
