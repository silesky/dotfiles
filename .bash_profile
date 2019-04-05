include () {
   [[ -f "$1" ]] && source "$1"
}

# also sources from zshrc
include ~/.bash_vars
include ~/.bash_paths # some vars are in paths...
include ~/.bashrc
include ~/.bash_functions
include ~/.bash_proj
include ~/.bash_private
include ~/.bash_aliases
include ~/.iterm2_shell_integration.`basename $SHELL`
