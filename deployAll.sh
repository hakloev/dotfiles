#!/bin/sh

SUDO=''

# Make sure root
checkRoot() {
    if [ "$EUID" != "0" ]; then
        if [ -x /usr/bin/sudo ]; then
            SUDO='sudo'
        else
            exit "You are not root, and sudo is not installed"
        fi
    fi
}

installDotfiles() {
    echo "Installing dotfiles"
    mkdir -p ~/git
    if [ ! -d ~/git/unix-dot ]; then
        git clone https://github.com/hakloev/unix-dot.git ~/git/unix-dot
    fi
    ~/git/unix-dot/deployDot.sh

    if [ "$OSTYPE" != "darwin13" ]; then
        if [ "$EUID" != "0" ]; then
             echo "Installing dotfiles for root"
             $SUDO su -c "git clone https://github.com/hakloev/unix-dot.git ~/git/unix-dot"
             $SUDO su -c "~/git/unix-dot/deployDot.sh"
        fi
    fi
}

installHomebrew() {
    which -a brew
    if [ $? != 0 ]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
        echo "Installed Homebrew"
    else 
        echo "Homebrew already installed"
    fi
}

zshFix() {
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
            echo "oh-my-zsh downloaded"
        else
            echo "oh-my-zsh already installed"
        fi

        if [ "$OSTYPE" != "darwin13" ]; then
            if [ "$EUID" != "0" ]; then
                echo "Installing oh-my-zsh for root"
                $SUDO su -c "curl -L http://install.ohmyz.sh | sh"
            fi
        fi
    fi
}

osxFix() {
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

createMotd() {
    echo "Creaing motd"
    curl --compressed "http://www.lemoda.net/games/figlet/figlet.cgi?text=$(hostname)&font=puffy&width=80" | $SUDO tee /etc/motd
    echo "Created motd"
}

main() {
    checkRoot    
    if [ "$OSTYPE" = "darwin13" ]; then
        echo "Bootstrapping Mac OS X"
        installHomebrew
        osxFix
    else
        echo "Bootstrapping "$OSTYPE""
        createMotd
    fi
    zshFix
    installDotfiles
}

main
