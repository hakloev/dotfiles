# Set up an alias for mosh-connection to caracal.stud.ntnu.no
alias caracal='mosh haakool@caracal.stud.ntnu.no'
alias DnB='vim ~/Documents/Brev\ ol\ /masters.txt'

# Set bash-name
export PS1="\u@\h:\w$ "

# Set history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Enables color in the terminal bash shell export
export CLICOLOR=1

# Sets up the color scheme for list export
export LSCOLORS=GxFxCxDxBxegedabagaced

#Tell grep to highlight matches
export GREP_OPTIONS=--color=auto

# Enables color for iTerm
export TERM=xterm-color
