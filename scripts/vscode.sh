#!/usr/bin/env bash

extensions=(
    "DotJoshJohnson.xml"
    "EditorConfig.EditorConfig"
    "aaronthomas.vscode-snazzy-operator"
    "christian-kohler.npm-intellisense"
    "christian-kohler.path-intellisense"
    "dbaeumer.vscode-eslint"
    "dustinsanders.an-old-hope-theme-vscode"
    "iGN97.fuse-vscode"
    "jakob101.RelativePath"
    "ms-vscode.node-debug2"
    "naumovs.color-highlight"
    "redhat.java"
    "robertohuertasm.vscode-icons"
    "sbrink.elm"
    "vscjava.vscode-java-debug"
    "vscjava.vscode-java-pack"
    "vsmobile.vscode-react-native"
)

for extension in ${extensions[@]}
do
  echo "Installing $extension"
  code --install-extension $extension
done
