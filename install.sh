#!/usr/bin/env bash

GIT_DIR="$HOME/git"

mkdir -p $GIT_DIR/{external,internal}

cd $GIT_DIR/internal

git clone --recursive https://github.com/hakloev/dotfiles.git

source bootstrap.sh
