setopt inc_append_history # keep history in chronological order (zsh)
setopt share_history # cmd in shell 1 becomes last command in shell two (zsh)
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify
# eval $(cachalot env)
# ______________ ZSH CONFIG _________________
# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh

# https://github.com/robbyrussell/oh-my-zsh/wiki/Customization
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom # any themes/* or plugins/* will override the default themes/plugins
ZSH_THEME="amuse" # full line with time
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  composer
  docker
  docker-compose
  github
  grunt
  gulp
  npm
  tmuxinator
  tmux
  yarn
  # nvm # slow
  #__ Custom - clone in  ~/.oh-my-zsh/custom/plugins
  git-open
  zsh-autosuggestions
  zsh-nvm # lazy load nvms
  z
 )
source $ZSH/oh-my-zsh.sh

#_______________END ZSH CONFIG____________________________

# zsh-autosuggestions
# git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=yellow"

bindkey -v #  enable vim mode
bindkey '^ ' autosuggest-accept # needs to go after bindkey -v
. ~/partials/zsh_vi_settings.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="$PATH:$HOME/.rvm/bin"
. ~/.bash_profile

export NVM_LAZY_LOAD=true
