#!/usr/bin/env bash

extensions=(
  "EditorConfig.EditorConfig"
  "dbaeumer.vscode-eslint"
  "sbrink.elm"
)

for extension in ${extensions[@]}
do
  echo "Installing $extension"
  code --install-extension $extension
done
