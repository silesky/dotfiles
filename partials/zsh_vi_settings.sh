#!/usr/bin/zsh
bindkey -v

bindkey '^r' history-incremental-search-backward
#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward
# This is the solution: up/down allows to either browse history (if field is empty) or search. Made my day.
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1