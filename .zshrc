

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

# ______________ ZSH CONFIG _________________
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom # any themes/* or plugins/* will override the default themes/plugins
ZSH_THEME="amuse" # full line with time

if [ ! -e "$ZSH_CUSTOM/plugins/autoenv" ]; then
  cd "$ZSH_CUSTOM/plugins"
  git clone git://github.com/kennethreitz/autoenv.git
else
  # is not a plugin
  source "$ZSH_CUSTOM/plugins/autoenv/activate.sh"
fi


if [ ! -e "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  cd "$ZSH_CUSTOM/plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  composer
  npm
  helm
  docker
  docker-compose
  history
  tmuxinator
  tmux
  yarn
  kubectl
  z
  zsh-iterm-touchbar
  #__ Custom - clone in  ~/.oh-my-zsh/custom/plugins
  zsh-autosuggestions
 )
TOUCHBAR_GIT_ENABLED=true
source $ZSH/oh-my-zsh.sh

# source everything
. ~/.bash_profile


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#_______________END ZSH CONFIG____________________________
# space in front of terminal during ssh bug
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# hstr config (brew install hstr) -- activate with hh
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors

# git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# colors https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245"

bindkey -v # enable vim mode
# load vim specific settings.
. ~/partials/zsh_vi_settings.sh

# use ctrl-space when using the zsh-autosuggest plugin. Needs to go after bindkey -v.
bindkey '^ ' autosuggest-accept


# iterm integration auto
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# rvm needs this for some reason
export PATH="$PATH:$HOME/.rvm/bin"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/seth.silesky/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/seth.silesky/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/seth.silesky/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/seth.silesky/google-cloud-sdk/completion.zsh.inc'; fi
