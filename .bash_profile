include () {
   [[ -f "$1" ]] && source "$1"
}
include ~/.paths
include ~/.bash_functions
include ~/.bash_proj
include ~/.bash_private
include ~/.bashrc
include ~/.bash_aliases
include ~/.iterm2_shell_integration.`basename $SHELL`
# Vi mode
