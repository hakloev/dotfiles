# PATH TO  MY oh-my-zsh CONFIG.
ZSH=$HOME/.oh-my-zsh

# SET CHARMAP
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# HISTORY SETTINGS
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=4500

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="risto"

# LOAD COLORS FOR PS1
autoload -U colors && colors
export CLICOLOR=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx sublime web-search virtualenv)

source $ZSH/oh-my-zsh.sh

# Exporting PS1, check OS or host and set color and aliases according to OS
if [[ $OSTYPE = 'darwin13.0' ]] ; then # Mac OS X
	# Customize to your needs for the $PATH...
	export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin:/Applications/scala/bin

	# PS1 with Git-plugin
	PROMPT="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[blue]%}%M:%{$fg[white]%}%2~ %(!.#.$) "
	
	# Aliases
    alias net="open -a Safari.app"
	alias DnB="vim ~/Documents/Brev\ ol\ /masters.txt"
	alias plink="mosh plex@192.168.1.6"
    
    # SUPPORT 256-COLORS
    export TERM='xterm-256color'
elif [[ $OSTYPE = 'linux-gnu' ]] ; then # Linux-distro with GNU
	# PS1 with Git-plugin
	PROMPT="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%M:%{$fg[white]%}%2~ %(!.#.$) "
else
	PROMPT="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[cyan]%}%M:%{$fg[white]%}%2~ %(!.#.$) "
    echo "Not recognized OS"
fi

# Show Git-Branch on right side
RPROMPT='$(git_prompt_info)%{$reset_color%} $EPS1'

# Universal aliases
alias logsys="tail -f /var/log/system.log"
alias c="clear"
alias ipecho="curl ipecho.net/plain; echo"
alias laa="ls -lah"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias v="vim"
alias rlink="mosh plex@link.loevdal.net"
alias caracal="mosh haakool@caracal.stud.ntnu.no"
alias loevdal="mosh hakloev@loevdal.net"


# Editor
EDITOR='vim' 

# Print the OS-type
echo $OSTYPE



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
