#!/usr/bin/env bash

cd $HOME/git/internal/dotfiles

source $(dirname "$0")/log.sh --source-only

function perform_step() {
  case $1 in
    dotfiles)
      sh scripts/dotfiles.sh
      ;;
    pip3)
      pip3 install --user -r requirements/pip3.txt
      ;;
    macos)
      sh scripts/macos.sh
      ;;
    *)
      warn "Unknown step: '$1'"
      ;;
  esac
}

function read_step_choice() {
  read -r -p "Do you want to perform the '$1' step? [yY] " -n 1 choice
  echo
  case $choice in
    [yY])
      info "Performing the '$1' step"
      perform_step $1
      ;;
    *)
      warn "Skipping the '$1' step"
      ;;
  esac

  if [ $? -ne 0 ]; then
    error "Step '$1' failed in some way"
  fi
}

steps=("dotfiles" "pip3" "macos")

for step in ${steps[@]}; do
  read_step_choice $step
done

success "Done bootstraping"
