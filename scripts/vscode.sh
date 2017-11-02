#!/usr/bin/env bash

extensions=(
    "EditorConfig.EditorConfig"
    "christian-kohler.path-intellisense"
    "dbaeumer.vscode-eslint"
    "dustinsanders.an-old-hope-theme-vscode"
    "iGN97.fuse-vscode"
    "jakob101.RelativePath"
    "ms-vscode.node-debug2"
    "naumovs.color-highlight"
    "robertohuertasm.vscode-icons"
    "sbrink.elm"
    "vsmobile.vscode-react-native"

)

for extension in ${extensions[@]}
do
  echo "Installing $extension"
  code --install-extension $extension
done
