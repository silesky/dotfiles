### .bashrc
# bash-specific variables -- a lot of this overlaps with ~/.bash_paths
tmux attach -d | tmux

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/Users/me/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/me/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                  # hh to be alias for hstr
export HISTFILE=~/.zsh_history # ensure history file visibility
export HSTR_CONFIG=hicolor     # get more colors
export HSTR_CONFIG=raw-history-view

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
