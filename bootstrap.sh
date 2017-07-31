# Taken from github.com/tmn/dotfiles/scripts/bootstrap
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}


info "Bootstraping started"

read -r -p "Link dotfiles? [yY/n] " -n 1 choice
echo
case $choice in
    [yY])
        info "Linking dotfiles"
        sh dotfiles.sh
        ;;
    *)
        info "Skipping dotfiles"
        ;;
esac


if [  "$(uname -s)" == "Darwin" ]; then
	info "Bootstraping macOS"
	sh macos.sh
	if [ $? -eq 0 ]; then
        success "macOS dependencies installed"
    else
        fail "Failed to install macOS dependencies"
    fi
fi

# Check for prezto
if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    info "Cloning ZSH Prezto"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
	success "Done cloning ZSH Prezto"
else
    info "ZSH Prezto present, skipping cloning"
fi

read -r -p "Install pip3 requirements? [yY/n] " -n 1 choice
echo
case $choice in
    [yY])
        info "Installing pip3 requirements"
        pip3 install -r requirements/pip3.txt
		success "Done installing pip3 requirements"
        ;;
    *)
        info "Skipping pip3 requirements"
        ;;
esac

success "Done bootstraping"
