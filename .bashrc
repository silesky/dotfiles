

### .bashrc
source $(brew --prefix php-version)/php-version.sh && php-version 7

env.cachalot() { eval $(cachalot env); } #takes the result of the 'cachalot env' command and executes it... basically a bunch of env variables

# [ -s "$nVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
alias loadnvm=". $NVM_DIR/nvm.sh"

# http://broken-by.me/lazy-load-nvm/
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}

# . ~/partials/autoload-nvmrc.sh #taken from https://github.com/creationix/nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export PATH="$PATH:/Applications/DevDesktop/tools"
export PATH="$PATH:$HOME/.rvm/bin"

