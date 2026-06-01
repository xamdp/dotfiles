#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NVIM
export PATH="$HOME/.local/share/pnpm:$PATH"
export NVIM_APPNAME='nvim'
export MANPAGER='nvim +Man!'

# export MANPAGER="nvr --remote-tab +Man! -"
# EMPTY_FILE and NO_FILE are needed for Git integration.
export EMPTY_FILE="$(mktemp -t empty.XXXXXX)"
export NO_FILE="/dev/null"

# Wraps nvr and handles cases when no arguments have been passed
# or when it’s needed to wait until the opened file is closed,
# e.g. v -w ${HOME}/.zshrc && source ${HOME}/.zshrc.
v() {
	if (( "$#" == 0 )); then nvr --remote-tab "${PWD}"
	elif [[ "$1" = "-w" ]]; then nvr --remote-tab-wait "${@:2}"
	else nvr --remote-tab "$@"; fi
}

# Updates the tab-local cwd on each cd call and names the buffer
# after it.
chpwd() {
	local pwd="fnameescape('${PWD}')"
	nvr --remote-expr "execute('tcd ' . ${pwd} . ' | file ' . \
		${pwd} . ' (' . nvim_get_current_tabpage() .')')" \
		> /dev/null &!
}

alias vim="setxkbmap -option caps:escape_shifted_capslock && nvim"

# alias kick='NVIM_APPNAME="nvim-kickstart" nvim'

export TERMINAL='alacritty'

# intellij IDEA
export PATH="$PATH:$HOME/opts/idea-IU-253.29346.240/bin/"


# go path
export PATH="$PATH:$HOME/go/bin"

# TLauncher
export PATH="$PATH:$HOME/minedev/mc"


# tmux
# [ -z "$TMUX"  ] && { tmux attach || exec tmux && exit;}

PATH="$PATH":"$HOME/.local/scripts/"
PATH="$PATH":"$HOME/.config/dunst/"

bind '"\C-f":"tmux-sessionizer\n"'

# NNN
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_OPTS='de' 
# alias ls='nnn' 

#lazygit
alias lg='lazygit'

# headless vm
alias start-apue='VBoxManage startvm "netbsd9" --type headless'


# claude code cli startup along with free-claude code connection envs
alias clad='ANTHROPIC_AUTH_TOKEN="freeclaudecode" ANTHROPIC_BASE_URL="http://localhost:8082" claude'

# for compiling
alias cc='gcc ${CFLAGS}'
CFLAGS='-Wall -Werror -Wextra'

. "$HOME/.local/bin/env"

[ -f ~/.free-coding-models.env ] && . ~/.free-coding-models.env  # free-coding-models-env

# pnpm
export PNPM_HOME="/home/diegs/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end


