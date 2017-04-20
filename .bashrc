### .bashrc
source $(brew --prefix php-version)/php-version.sh && php-version 7

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias loadrvm="source '$HOME/.rvm/scripts/rvm'"

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
alias loadnvm=". $NVM_DIR/nvm.sh"
# . ~/partials/autoload-nvmrc.sh #taken from https://github.com/creationix/nvm
# oh-my-zsh slow https://github.com/robbyrussell/oh-my-zsh/issues/5327


