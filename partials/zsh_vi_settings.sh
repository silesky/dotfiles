#!/usr/bin/zsh
bindkey -v # enable vim mode

 function zle-keymap-select zle-line-init
 {
     # change cursor shape in iTerm2
     case $KEYMAP in
         vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
         viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
     esac

     zle reset-prompt
     zle -R
 }

 function zle-line-finish
 {
     print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
 }

 # Disable different lines bc slow and only works without tmux
  zle -N zle-line-init
  zle -N zle-line-finish
  zle -N zle-keymap-select


export KEYTIMEOUT=5 #if I set it too low, can't switch with j j

# history search forward
bindkey '^f' history-beginning-search-forward #use the current input
bindkey -M viins '^f' history-beginning-search-forward
bindkey -M vicmd '^f' history-beginning-search-forward

# history search back
bindkey '^b' history-beginning-search-backward
bindkey -M viins '^b' history-beginning-search-backward
bindkey -M vicmd '^b' history-beginning-search-backward

# clear line (standard bash)
bindkey '^u' kill-whole-line
bindkey -M viins '^u' kill-whole-line
bindkey -M vicmd '^u' kill-whole-line

# clear screen (ctrl-l replacement)
bindkey '^y' clear-screen
bindkey -M viins '^y' clear-screen
bindkey -M vicmd '^y' clear-screen

# ctrl-left and right arrow (like emacs mode)
bindkey -M viins "^[[1;5C" forward-word
bindkey -M vicmd "^[[1;5C" forward-word
bindkey -M vicmd "^[[1;5D" backward-word
bindkey -M viins "^[[1;5D" backward-word

#######################################################
# stolen shamelessly from oh-my-zsh vi plugin ###
# Updates editor information when the keymap changes.

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# backward kill word (standard behavior_
bindkey '^w' backward-kill-word
bindkey -M viins '^w' backward-kill-word
bindkey -M vicmd '^w' backward-kill-word

# allow ctrl-r to perform backward search in history
bindkey '^r' history-incremental-search-backward
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
#
# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^e' end-of-line
bindkey -M viins '^e' end-of-line
bindkey -M vicmd '^e' end-of-line

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[green]%}<==<==<==<==<==%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
### ---------------------------------------------- ###
