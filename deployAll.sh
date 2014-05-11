#!/bin/bash

SUDO=''

# Make sure root

if [[ $EUID -ne 0 ]]; then
    if [ -x /usr/bin/sudo ]; then
        SUDO='sudo'
    else
        exit "You are not root, and sudo is not installed"
    fi
fi

function installDotfiles() {
    echo "Installing dotfiles"
    mkdir -p ~/git
    if [ ! -d ~/git/unix-dot ]; then
        git clone https://github.com/hakloev/unix-dot.git ~/git/unix-dot
    fi
    ~/git/unix-dot/deployDot.sh

    if [ "$OSTYPE" != "darwin13" ]; then
        if [[ $EUID -ne 0 ]]; then
             echo "Installing dotfiles for root"
             $SUDO su -c "git clone https://github.com/hakloev/unix-dot.git ~/git/unix-dot"
             $SUDO su -c "~/git/unix-dot/deployDot.sh"
        fi
    fi
}

function installHomebrew() {
    which -s brew
    if [ $? != 0 ]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
        echo "Installed Homebrew"
    else 
        echo "Homebrew already installed"
    fi
}

function zshFix() {
    which -s zsh
    if [ $? != 0 ]; then
        echo "ZSH is not installed"
    else
        if [ "$SHELL" != "/bin/zsh" ]; then
            echo "Changing shell to zsh"
            chsh -s /bin/zsh
        else
            echo "Default shell already ZSH"
        fi
        
        if [ ! -d ~/.oh-my-zsh ]; then
            echo "Downloading oh-my-zsh"
            curl -L http://install.ohmyz.sh | sh
            echo "oh-my-zsh downloaded"
        else
            echo "oh-my-zsh already installed"
        fi

        if [ "$OSTYPE" != "darwin13" ]; then
            if [[ $EUID -ne 0 ]]; then
                echo "Installing oh-my-zsh for root"
                $SUDO su -c curl -L http://install.ohmyz.sh | sh
            fi
        fi
    fi
}

function createMotd() {
    echo "Creaing motd"
    curl --compressed "http://www.lemoda.net/games/figlet/figlet.cgi?text=$(hostname)&font=puffy&width=80" | $SUDO tee /etc/motd
    echo "Created motd"
}

function main() {
    if [ "$OSTYPE" = "darwin13" ]; then
        echo "Bootstrapping Mac OS X"
        installHomebrew
    else
        echo "Bootstrapping $OSTYPE"
        createMotd
    fi
    zshFix
    installDotfiles
}

main
