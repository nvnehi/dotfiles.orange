#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -Gh --color=auto'
export PROMPT_COMMAND='echo -ne "\033]0;urvxt\007"'
#export LS_COLORS="di=1;95:ln=95:ex=92:fi=91:"
export LS_COLORS="di=1;31:ln=31:so=32:pi=33:ex=37:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export PS1="\[\033[38;5;255m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;8m\]——\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export VISUAL=subl3
export EDITOR=vim
