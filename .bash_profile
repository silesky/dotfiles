include () {
   [[ -f "$1" ]] && source "$1"
}
include ~/.bash_vars #variables go first
include ~/.bash_paths # some vars are in paths...
include ~/.bashrc
include ~/.bash_functions
include ~/.bash_proj
include ~/.bash_private
include ~/.bash_aliases
include ~/.iterm2_shell_integration.`basename $SHELL`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
