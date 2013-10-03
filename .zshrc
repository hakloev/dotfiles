# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set charmap
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin:/Applications/scala-2.10.2/bin 
# History 
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=4500

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="risto"

# Example aliases
alias DnB="vim ~/Documents/Brev\ ol\ /masters.txt"
alias caracal="mosh haakool@caracal.stud.ntnu.no"
alias loevdal="mosh hakloev@loevdal.net"
alias ls="ls -lah"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Loading colors for PS1
autoload -U colors && colors

# Exporting PS1, check OS or host and set color due to that
if [[ "$HOST" == 'loevdal.local' ]] ; then
    export PS1="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[blue]%}%M:%{$fg[white]%}%2~ $(git_prompt_info)%{$reset_color%}%(!.#.$) %"
    echo "You are on host: loevdal.local, Mac OS X"
elif [[ "$OSTYPE" = 'darwin12.0' ]] ; then
    export PS1="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[cyan]%}%M:%{$fg[white]%}%2~ $(git_prompt_info)%{$reset_color%}%(!.#.$) %"
    echo "You are on a Mac OS X host"
elif [[ "$OSTYPE" = 'linux-gnu' ]] ; then
     export PS1="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%M:%{$fg[white]%}%2~ $(git_prompt_info)%{$reset_color%}%(!.#.$) %"
     echo "You are on a Linux OS host"
else 
     export PS1="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[red]%}%M:%{$fg[white]%}%2~ $(git_prompt_info)%{$reset_color%}%(!.#.$) %"
     echo "You are not on any recognized host"
fi
