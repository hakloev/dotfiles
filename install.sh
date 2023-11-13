#!/usr/bin/env bash

GIT_DIR="$HOME/git/internal"

mkdir -p $GIT_DIR
cd $GIT_DIR

git clone --recursive https://github.com/hakloev/dotfiles.git

source bootstrap.sh