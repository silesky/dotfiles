include () {
   [[ -f "$1" ]] && source "$1"
}
include ~/.paths
include ~/.bash_functions
include ~/.bash_proj
include ~/.bash_private
include ~/.bashrc
include ~/.bash_aliases
# Vi mode
set -o vi
# tmuxinator thing
DISABLE_AUTO_TITLE=true

# alias terminus1x=$HOME/terminus1x/vendor/bin/terminus

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
