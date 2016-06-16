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
    echo "[INFO] Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "[INFO] homebrew present, skipping install"
fi

source 'dotfiles.sh'
source 'osx_settings.sh'

# Update homebrew
brew update

echo "[WARNING] Before we continue, run 'brew bundle install' in './requirements'"
echo "[WARNING] Press enter to continue"
read

echo "[INFO] pip3 requirements"
pip3 install -r requirements/pip3.txt

echo "[INFO] Done bootstraping"
