### .bashrc

export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTCONTROL=ignoredups:erasedups
export VISUAL=mvim
export EDITOR="$VISUAL"
export EVENT_NOKQUEUE=1 #fix for broken kqueue message in tmux`

source $(brew --prefix php-version)/php-version.sh && php-version 7

set -o vi
# tmuxinator thing

# alias terminus1x=$HOME/terminus1x/vendor/bin/terminus

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
alias loadnvm="source '$HOME/.rvm/scripts/rvm'"
# oh-my-zsh slow https://github.com/robbyrussell/oh-my-zsh/issues/5327


