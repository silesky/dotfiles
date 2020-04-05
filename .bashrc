### .bashrc
# bash-specific variables -- a lot of this overlaps with ~/.bash_paths
# tmux attach -d | tmux


# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                  # hh to be alias for hstr
export HISTFILE=~/.zsh_history # ensure history file visibility
export HSTR_CONFIG=hicolor     # get more colors
export HSTR_CONFIG=raw-history-view

