#!/bin/bash

function deploy_dot_files() {
    echo "Installing dotfiles"
    ~/git/unix-dot/deployDot.sh
}

function config_osx() {
    echo "Setting OS X spesific settings"
    source ~/git/unix-dot/osx_config
}

function zsh_fix() {
    which -a zsh &> /dev/null
    if [ $? != 0 ]; then
        echo "ZSH is not installed"
    else
        if [ "$SHELL" != "/bin/zsh" ]; then
            echo "Changing shell to ZSH"
            chsh -s /bin/zsh &> /dev/null
        else
            echo "Default shell already ZSH"
        fi
    fi
}

function main() {
    deploy_dot_files
    if [[ $(uname -s) == "Darwin" ]]; then
        echo "Bootstrapping Mac OS X"
        xcode-select --install
        zsh_fix
        config_osx
    else
        echo "Bootstrapping $(uname -s)"
        #set_motd
        zsh_fix
    fi
    echo "Remember to add prezto"
}

main
