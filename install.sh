#!/usr/bin/env bash

DIR="$HOME/git/internal"
mkdir -p $DIR
cd $DIR
git clone --recursive https://github.com/hakloev/dotfiles.git
cd dotfiles
source bootstrap.sh
