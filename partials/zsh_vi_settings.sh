#!/usr/bin/zsh
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# enable "VI-MODE plugin"
bindkey '^r' history-incremental-search-backward #uses the mini buffer
bindkey '^f' history-beginning-search-forward #use the current input
bindkey '^b' history-beginning-search-backward
bindkey '^w' backward-kill-line
bindkey -M viins '^w' backward-kill-line
bindkey -M viins '^f' history-beginning-search-forward
bindkey -M viins '^b' history-beginning-search-backward
bindkey '^y' clear-screen
export KEYTIMEOUT=1
