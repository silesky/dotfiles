#!/usr/bin/zsh
precmd() { RPROMPT="" }
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^B' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
bindkey -M viins '^Y' clear-screen
#
#
#function zle-line-init zle-keymap-select {
#   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#   zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
export KEYTIMEOUT=1
