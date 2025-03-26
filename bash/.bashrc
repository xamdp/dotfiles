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

export PATH="$HOME/.local/share/pnpm:$PATH"
alias nvim="setxkbmap -option caps:escape_shifted_capslock && nvim"


# tmux
[ -z "$TMUX"  ] && { tmux attach || exec tmux && exit;}

PATH="$PATH":"$HOME/.local/scripts/"
bind '"\C-f":"tmux-sessionizer\n"'

# NNN
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_OPTS='de' 
# alias ls='nnn' 

#lazygit
alias lg='lazygit'

