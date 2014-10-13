#!/bin/bash

function deploy_dot_files() {
    echo "Installing dotfiles"
    ~/git/unix-dot/deployDot.sh
}

function install_brew() {
    which -a brew &> /dev/null
    if [ $? != 0 ]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
        brew doctor
    else 
        echo "Homebrew already installed"
    fi
}

function config_osx() {
    echo "Setting OS X spesific settings"
    source ~/git/unix-dot/osx_config
}

function set_motd() {
    echo "Creaing motd"
    curl --compressed "http://www.lemoda.net/games/figlet/figlet.cgi?text=$(hostname)&font=puffy&width=80" | $SUDO tee /etc/motd
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
        
        if [ ! -d ~/.oh-my-zsh ]; then
            echo "Downloading oh-my-zsh"
            curl -L http://install.ohmyz.sh | sh
        else
            echo "oh-my-zsh already installed"
        fi
    fi
}

function main() {
    deploy_dot_files
    if [[ $(uname -s) == "Darwin" ]]; then
        echo "Bootstrapping Mac OS X"
        xcode-select --install
        zsh_fix
        install_brew
        config_osx
    else
        echo "Bootstrapping $(uname -s)"
        set_motd
        zsh_fix
    fi
}

main
