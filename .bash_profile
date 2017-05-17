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


# mouse settings, etc

