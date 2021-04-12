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

ZSH_DISABLE_COMPFIX=true # fix zsh error message about completion permissions
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

setopt globdots # when using tab completion, show hidden files and folders (such as dotfiles)

# All Colors: https://coderwall.com/p/pb1uzq/z-shell-colors
# Colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=214,bg=none,bold,underline"


#############
# ______________ ZSH CONFIG _________________
# Path to your oh-my-zsh installation.

export ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.oh-my-zsh-custom
ZSH_THEME="amuse-custom"
ENABLE_CORRECTION="false"


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
   [ ! -d "./zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  cd $dir
}
get_plugins

function _clone_create_dir() {
  local remote_repo_url=$1
  local local_repo_path=$2
  local args=$3
  if [ ! -d "$local_repo_path" ]; then
    mkdir -p $local_repo_path
    git clone $remote_repo_url $local_repo_path $args
  fi
}
function install_tpm() {
  local TPM_PATH="$HOME/.tmux/plugins/tpm"
   _clone_create_dir https://github.com/tmux-plugins/tpm $TPM_PATH
}
install_tpm

# change directory without using 'cd'
setopt auto_cd

# cd into projects from any directory
cdpath=(~/projects ~/projects/shipengine)

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
  mix
  asdf
  # dotnet
  # helm
  # yarn
  # kubectl
  # emacs
  #__ Custom - clone in  ~/.oh-my-zsh/custom/plugins
  zsh-vim-mode
  # zsh-syntax-highlighting
  zsh-autosuggestions

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
#
. ~/partials/zsh_vi_settings.zsh # load vim specific settings.

# use ctrl-space when using the zsh-autosuggest plugin. Needs to go after bindkey -v.
bindkey '^ ' autosuggest-accept

eval "$(direnv hook zsh)"

# This requires the asdf plugin
# https://github.com/asdf-community/asdf-direnv#setup
eval "$(asdf exec direnv hook bash)"
