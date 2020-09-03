
#!/usr/bin/env zsh
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

# don't show errors on command not found
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# when using tab completion, show hidden files and folders (such as dotfiles)
setopt globdots

# ______________ ZSH CONFIG _________________
# Path to your oh-my-zsh installation.

export ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.oh-my-zsh-custom
ZSH_THEME="amuse-custom"
ENABLE_CORRECTION="true"
function in_path {
  builtin type -P "$1" &> /dev/null
}
function get_plugins() {
  local dir=$(pwd)
  ZSH_PLUGINS="$ZSH_CUSTOM/plugins"
  [ ! -d $ZSH_PLUGINS ] && mkdir -p $ZSH_PLUGINS
  cd $ZSH_PLUGINS
  [ ! -d "./autoenv" ] && git clone git://github.com/kennethreitz/autoenv.git
  [ ! -d "./autoenv" ] && git clone git://github.com/kennethreitz/autoenv.git
  [ ! -d "./zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions
  [ ! -d "./zsh-z" ] && git clone https://github.com/agkozak/zsh-z
  # [ ! -d "./zsh-easy-motion" ] && git clone https://github.com/IngoHeimbach/zsh-easy-motion
  cd $dir
}
get_plugins

# get tpm
function get_tpm() {
 # [ ! -d "~/.tmux/plugins" ] && echo "installing tpm" && mkdir -p ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}
get_tpm

# cd into projects from any directory
setopt auto_cd
cdpath=(~/projects ~/projects/lm-core)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
npm
# helm
docker
docker-compose
history
tmuxinator
yarn
kubectl
zsh-z
last-working-dir
#__ Custom - clone in  ~/.oh-my-zsh/custom/plugins
zsh-autosuggestions
# zsh-easy-motion
)
TOUCHBAR_GIT_ENABLED=true
source $ZSH/oh-my-zsh.sh

# source everything
. ~/.bash_profile


#_______________END ZSH CONFIG____________________________
# space in front of terminal during ssh bug
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# hstr config (brew install hstr) -- activate with hh
# All Colors: https://coderwall.com/p/pb1uzq/z-shell-colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=220"
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors

. ~/partials/zsh_vi_settings.sh  # load vim specific settings.

# use ctrl-space when using the zsh-autosuggest plugin. Needs to go after bindkey -v.
bindkey '^ ' autosuggest-accept

ENABLE_CORRECTION="true"
# iterm integration auto
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

