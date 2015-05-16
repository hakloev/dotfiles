#!/bin/bash

function deploy_dot_files() {
    
    echo "################################"
    echo "Installing dotfiles"
    echo "################################"
    ~/git/unix-dot/deployDot.sh
}

function config_osx() {
    echo "################################"
    echo "Setting OS X spesific settings"
    echo "################################"
    source ~/git/unix-dot/osx_config
}

function zsh_fix() {
    which -a zsh &> /dev/null
    if [ $? != 0 ]; then
        echo "################################"
        echo "You must install ZSH"
        echo "################################"
    else
        if [ "$SHELL" != "/bin/zsh" ]; then
            echo "################################"
            echo "Changing shell to ZSH"
            echo "################################"
            chsh -s /bin/zsh &> /dev/null
        else
            echo "################################"
            echo "Default shell already ZSH"
            echo "################################"
            
            
        fi
    fi
}

function main() {
    deploy_dot_files
    if [[ $(uname -s) == "Darwin" ]]; then
        echo "################################"
        echo "Bootstrapping Mac OS X"
        echo "################################"
        xcode-select --install
        zsh_fix
        config_osx
    else
        echo "################################"
        echo "Bootstrapping $(uname -s)"
        echo "################################"
        zsh_fix
    fi
    echo "################################"
    echo "Remember to add prezto"
    echo "################################"
}

main
