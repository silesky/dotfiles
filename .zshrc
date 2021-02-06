#!/usr/bin/env zsh
# https://unix.stackexchange.com/questions/103898/how-to-start-tmux-with-attach-if-a-session-exists
# tmux attach || tmux new

# iterm integration auto
# export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink at ~/.node/current/bin/node
# export NVM_DIR="$HOME/.nvm"
# export NVM_LAZY_LOAD=true

# If this is set, zsh sessions will append their history list to the history file, rather than replace it. Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file, in the order that they exit. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt append_history

# keep history in chronological order (zsh)
setopt inc_append_history
setopt share_history

# cmd in shell 1 becomes last command in shell two (zsh)
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space

# Remove superfluous blanks from each command line being added to the history list.
setopt hist_reduce_blanks

# Remove the history (fc -l) command from the history list when invoked. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line.
setopt hist_no_store

# Whenever the user enters a line with history expansion, don’t execute the line directly; instead,erform history expansion and reload the line into the editing buffer.
setopt hist_verify

export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}
export HISTFILE=~/.zsh_history # ensure history file visibility
export HH_CONFIG=hicolor       # get more colors
export HSTR_CONFIG=hicolor     # get more colors
ZSH_DISABLE_COMPFIX=true
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# when using tab completion, show hidden files and folders (such as dotfiles)
setopt globdots

# ______________ ZSH CONFIG _________________
# Path to your oh-my-zsh installation.

export ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.oh-my-zsh-custom
ZSH_THEME="amuse-custom"
ENABLE_CORRECTION="false"

# function in_path {
#   builtin type -P "$1" &> /dev/null
# }

function get_plugins() {
  local dir=$(pwd)
  ZSH_PLUGINS="$ZSH_CUSTOM/plugins"
  [ ! -d $ZSH_PLUGINS ] && mkdir -p $ZSH_PLUGINS
  cd $ZSH_PLUGINS
  [ ! -d "./autoenv" ] && git clone git://github.com/kennethreitz/autoenv.git
  [ ! -d "./zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions
  [ ! -d "./zsh-z" ] && git clone https://github.com/agkozak/zsh-z
  [ ! -d "./zsh-vim-mode" ] && git clone https://github.com/softmoth/zsh-vim-mode.git
  # [ ! -d "./zsh-easy-motion" ] && git clone https://github.com/IngoHeimbach/zsh-easy-motion
  cd $dir
}
get_plugins

# get tpm
# function get_tpm() {
#   [ ! -d "~/.tmux/plugins" ] && echo "installing tpm" && mkdir -p ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#}
# get_tpm

# change directory without using 'cd'
setopt auto_cd

# cd into projects from any directory
cdpath=(~/projects ~/projects/shipengine ~/projects/scratch)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  npm
  docker
  docker-compose
  history
  tmuxinator
  zsh-z
  last-working-dir
  direnv # auto-load .envrc in directories (replaces eval) -- not strictly needed for asdf
  asdf
  # dotnet
  # helm
  # yarn
  # kubectl
  # emacs
  #__ Custom - clone in  ~/.oh-my-zsh/custom/plugins
  zsh-autosuggestions
  zsh-vim-mode

)
source $ZSH/oh-my-zsh.sh

# https://stackoverflow.com/a/58862453 -- backwards kill word - ctrl+w works!
autoload -Uz select-word-style
select-word-style shell

# source everything
. ~/.bash_profile

#_______________END ZSH CONFIG____________________________
# space in front of terminal during ssh bug
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# hstr config (brew install hstr) -- activate with hh
# All Colors: https://coderwall.com/p/pb1uzq/z-shell-colors
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=220"
#
. ~/partials/zsh_vi_settings.zsh # load vim specific settings.

# use ctrl-space when using the zsh-autosuggest plugin. Needs to go after bindkey -v.
bindkey '^ ' autosuggest-accept

# install direnv -- basically, just for nix
# need to nix-env -i direnv
# https://nixos.wiki/wiki/Development_environment_with_nix-shell
if [ -e /Users/me/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/me/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Silent direnv message
export DIRENV_LOG_FORMAT=""
