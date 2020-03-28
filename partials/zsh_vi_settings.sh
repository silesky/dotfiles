#!/usr/bin/zsh

####################################
# VIM INSERT MODE CHANGE CURSOR SHAPE
# https://github.com/jcorbin/home/edit/master/.zsh/rc.d/vi-mode-cursor
####################################
function print_dcs
{
  print -n -- "\EP$1;\E$2\E\\"
}

function set_cursor_shape
{
  if [ -n "$TMUX" ]; then
    # tmux will only forward escape sequences to the terminal if surrounded by
    # a DCS sequence
    print_dcs tmux "\E]50;CursorShape=$1\C-G"
  else
    print -n -- "\E]50;CursorShape=$1\C-G"
  fi
}

function zle-keymap-select zle-line-init
{
  case $KEYMAP in
    vicmd)
      set_cursor_shape 0 # block cursor
      ;;
    viins|main)
      set_cursor_shape 1 # line cursor
      ;;
  esac
  zle reset-prompt
  zle -R
}

function zle-line-finish
{
  set_cursor_shape 0 # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
###################################### end script.
##############################################################

##############################################################
# VIM INSERT MODE INDICATOR "<<<<"
##############################################################
# if [[ "$MODE_INDICATOR" == "" ]]; then
#   MODE_INDICATOR="%{$fg_bold[green]%}<==<==<==<==<==%{$reset_color%}"
# fi
#
# function vi_mode_prompt_info() {
#   echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
# }
#
# # define right prompt, if it wasn't defined by a theme
# if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
#   RPS1='$(vi_mode_prompt_info)'
# fi
###################################### end script.
##############################################################

export KEYTIMEOUT=5 #if I set it too low, can't switch with j j


# history search forward
bindkey '^f' history-beginning-search-forward #use the current input
bindkey -M viins '^f' history-beginning-search-forward
bindkey -M vicmd '^f' history-beginning-search-forward

# history search back
bindkey '^b' history-beginning-search-backward
bindkey -M viins '^b' history-beginning-search-backward
bindkey -M vicmd '^b' history-beginning-search-backward

# backward k char (standard behavior_
bindkey '^x' backward-delete-char
bindkey -M viins '^x' backward-delete-char
bindkey -M vicmd '^x' backward-delete-char

# kill whole line
bindkey '^d' kill-whole-line
bindkey -M viins '^d' kill-whole-line
bindkey -M vicmd '^d' kill-whole-line

# clear line (standard bash)
bindkey '^u' backward-kill-line
bindkey -M viins '^u' backward-kill-line
bindkey -M vicmd '^u' backward-kill-line

# clear screen (ctrl-l replacement)
bindkey '^y' clear-screen
bindkey -M viins '^y' clear-screen
bindkey -M vicmd '^y' clear-screen

# ctrl-left and right arrow (like emacs mode)
bindkey "^[[1;5C" forward-word
bindkey -M viins "^[[1;5C" forward-word
bindkey -M vicmd "^[[1;5C" forward-word

bindkey "^[[1;5D" backward-word
bindkey -M vicmd "^[[1;5D" backward-word
bindkey -M viins "^[[1;5D" backward-word

#######################################################
# stolen shamelessly from oh-my-zsh vi plugin ###
# Updates editor information when the keymap changes.

# enable vim mode
bindkey -v

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
# allow ctrl-a and ctrl-q to move to beginning/end of line
bindkey '^q' beginning-of-line
bindkey -M viins '^e' beginning-of-line
bindkey -M vicmd '^q' beginning-of-line

bindkey '^e' end-of-line
bindkey -M viins '^e' end-of-line
bindkey -M vicmd '^e' end-of-line

