#!/usr/bin/env bash

DIR="$HOME/git/internal"

mkdir -p $DIR
cd $DIR

git clone --recursive https://github.com/hakloev/dotfiles.git

cd dotfiles

if [  "$(uname -s)" == "Darwin" ]; then
  echo "install homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#source bootstrap.sh
