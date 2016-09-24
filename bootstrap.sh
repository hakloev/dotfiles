echo "[INFO] Starting bootstraping"

# Check for prezto
if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    echo "[INFO] Installing prezto"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
    echo "[INFO] prezto present, skipping install"
fi

# Check for homebrew
if test ! $(which brew); then
    echo "[INFO] Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "[INFO] Homebrew present, skipping install"
fi

read -r -p "[INFO] Link dotfiles? [Y/n] " -n 1 choice
echo
case $choice in
    [yY])
        echo "[INFO] Linking dotfiles"
        source 'dotfiles.sh'
        ;;
    *)
        echo "[INFO] Skipping dotfiles"
        ;;
esac

# Update homebrew
echo "[INFO] Updating brew"
brew update

echo "[WARNING] Before we continue, run 'brew bundle install' in './requirements'"
read -r -p "[WARNING] Press enter to continue " -n 1

read -r -p "[INFO] Install pip3 requirements? [Y/n] " -n 1 choice
echo
case $choice in
    [yY])
        echo "[INFO] Installing pip3 requirements"
        pip3 install -r requirements/pip3.txt
        ;;
    *)
        echo "[INFO] Skipping pip3 requirements"
        ;;
esac

echo "[INFO] Done bootstraping"
