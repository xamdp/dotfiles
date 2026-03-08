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
[ -z "$TMUX"  ] && { tmux attach || exec tmux && exit;}

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

# for compiling
alias cc='gcc ${CFLAGS}'
CFLAGS='-Wall -Werror -Wextra'
