#!/bin/bash

ls ~/git/unix-dot/dotfiles | while read FILE

do
    rm -r ~/.$FILE &> /dev/null
    ln -s ~/git/unix-dot/dotfiles/$FILE ~/.$FILE
    echo "Created symlink for $FILE"
done

touch ~/.zsh_history
touch ~/.bash_history
    
echo "All dotfiles symlinked"
