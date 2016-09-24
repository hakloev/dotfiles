#!/usr/bin/env bash

DIR="$HOME/git/internal"
mkdir -p $DIR
cd $DIR
git clone --recursive https://github.com/hakloev/unix-dot.git
cd unix-dot
source bootstrap.sh
