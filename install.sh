#!/bin/sh 

CURROSX="darwin13.0"

echo "################# install.sh #####################"
echo "################## hakloev #######################"

function installDot {
    echo "\n############ INSTALLING DOTFILES #################"

    for file in bash_profile gitconfig gitexcludes screenrc vimrc zshrc vim; do
        rm -f ~/.$file
        ln -s $PWD/.$file ~/.$file;
        echo "Symlinked $file"
    done

    touch ~/.zsh_history
    touch ~/.bash_history
    
    echo "\nDotfiles symlinked\n"

    if [ $OSTYPE=$CURROSX ]; then
        rm -f ~/.slate
        ln -s $PWD/.slate ~/.slate;
        echo "Symlinked .slate"
        echo "\nRemember the sudo-command with htop"
    fi

    echo "############## INSTALLED DOTFILES ################\n"
}

function osx {
     # Homebrew, git, zsh, oh-my-zsh
     which -s brew 
     if [ $? != 0 ]; then
        echo "Do you want to install brew? [y/n]: "
        read answer
        echo 
        if [ $answer == "y" ]; then
            echo "\n############ INSTALLING HOMEBREW ################"
            ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
            echo "\n############ INSTALLED HOMEBREW #################"
        else 
            echo "Okey, will not install brew"
        fi
    fi
    which -s git
    if [ $? != 0 ]; then
        echo "Do you want to install git? [y/n]: "
        read answer
        echo
        if [ $answer == "y" ]; then
            echo "\n############### INSTALLING GIT #################"
            brew install git
            echo "\n############### INSTALLED GIT ##################"
        else 
            echo "Okey, will not install git"
        fi
    fi
}

function zshfix {
    which -s zsh 
    if [ $? != 0 ]; then
        echo "ZSH not installed"
    else
        echo "ZSH is installed, will change shell"
        chsh -s /bin/zsh
        which -s git
        if [ $? != 0 ]; then
            echo "Git is not installed, can't curl oh-my-zsh"
        else
            echo "Adding oh-my-zsh"
            curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
        fi
    fi  
}

function main {
    # Dotfiles
    echo "Do you want to install dotfiles? [y/n]: "
    read answer
    echo

    if [ $answer == "y" ]; then
        installDot
    else
        echo "Okey, will not install dotfiles"
    fi

    # SSH-keygen
    echo "Do you want to generate ssh-public key? [y/n]: "
    read answer
    echo

    if [ $answer == "y" ]; then
        echo "\n############ GENERATING SSH-KEY #################" i
        ssh-keygen
        echo "\n############ GENEREATED SSH-KEY #################"
    else 
        echo "Okey, will not generate ssh-public key"
    fi
    
    if [ $OSTYPE=$CURROSX ]; then 
        osx
    fi    
    
    # Check zsh
    zshfix
}

main

echo "\n################ install.sh ######################"
echo "############### OPERATION COMPLETE ###############"
