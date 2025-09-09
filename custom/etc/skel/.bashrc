stty -ixon

# # Interactive
[[ $- != *i* ]] && return

# Environment
PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 7)\][\w]\[$(tput setaf 7)\]\$ \[$(tput sgr0)\]"
export HISTSIZE= HISTFILESIZE=
export EDITOR="vi" VISUAL="vi"

# How to add a directory to the $PATH
# export PATH="$PATH:~/go/bin"

# Colored man pages
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# Aliases
alias ls="ls -gh --time-style='+%Y %H:%M' --color=auto --group-directories-first"
alias l="ls" s="ls" sl="ls"
alias cp="cp -v" mv="mv -v" rm="rm -v"
alias objdump="objdump -M intel"
alias find="fd"
alias grep="rg"
alias dig="q"
alias free="free -h" du="du -h" df="df -h"

# Making xclip use the system clipboard by default
# alias xclip="xclip -selection clipboard"

# Bindings
bind "'\C-x': edit-and-execute-command"

# Starting or attaching to a Tmux session for every new shell
# Tmux
# if [[ -n "$DISPLAY" && -z "$TMUX" ]]; then
#         exec tmux new -A -s main
# fi
