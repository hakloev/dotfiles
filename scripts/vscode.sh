#!/usr/bin/env bash

extensions=(
  "EditorConfig.EditorConfig"
  "abadi199.elm-format"
  "dbaeumer.vscode-eslint"
  "sbrink.elm"
)

for extension in ${extensions[@]}
do
  echo "Installing $extension"
  code --install-extension $extension
done
