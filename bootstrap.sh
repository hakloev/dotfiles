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


read -r -p "Link dotfiles? [yY/n] " -n 1 choice
echo
case $choice in
    [yY])
        echo "Linking dotfiles"
        sh scripts/dotfiles.sh
        ;;
    *)
        info "Skipping dotfiles"
        ;;
esac


if [  "$(uname -s)" == "Darwin" ]; then
  echo "Bootstraping macOS"
  sh scripts/macos.sh
  if [ $? -eq 0 ]; then
        success "macOS dependencies installed"
        info "Remember to run 'brew bundle install' in './requirements' to install dependencies"
        read -r -p "Press enter to continue " -n 1
    else
        fail "Failed to install macOS dependencies"
    fi
fi


read -r -p "Install pip3 requirements? [yY/n] " -n 1 choice
echo
case $choice in
    [yY])
        echo "Installing pip3 requirements"
        pip3 install --user -r requirements/pip3.txt
        success "Done installing pip3 requirements"
        ;;
    *)
        info "Skipping pip3 requirements"
        ;;
esac

success "Done bootstraping"
