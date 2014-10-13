#!/bin/bash

function deploy_dot_files() {
    echo "Installing dotfiles"
    ~/git/unix-dot/deployDot.sh
}

function install_brew() {
    which -a brew
    if [ $? != 0 ]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    else 
        echo "Homebrew already installed"
    fi
}

function config_osx() {
    echo "Setting OS X spesific settings"
    # Always open everything in Finder's list view. This is important.
    defaults write com.apple.Finder FXPreferredViewStyle Nlsv
    # Show the ~/Library folder.
    chflags nohidden ~/Library
    # Set a really fast key repeat.
    defaults write NSGlobalDomain KeyRepeat -int 0
    # Set the Finder prefs for showing a few different volumes on the Desktop.
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
    # Set up Safari for development.
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
    killall Finder
}

function set_motd() {
    echo "Creaing motd"
    curl --compressed "http://www.lemoda.net/games/figlet/figlet.cgi?text=$(hostname)&font=puffy&width=80" | $SUDO tee /etc/motd
}

function zsh_fix() {
    which -a zsh
    if [ $? != 0 ]; then
        echo "ZSH is not installed"
    else
        if [ "$SHELL" != "/bin/zsh" ]; then
            echo "Changing shell to ZSH"
            chsh -s /bin/zsh
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
    exit
    if [[ 'uname -s' == Darwin ]]; then
        echo "Bootstrapping Mac OS X"
        config_osx
        install_brew
    else
        echo "Bootstrapping $(uname -s)"
        set_motd
    fi
    zshFix
}

main
