include() {
   [[ -f "$1" ]] && source "$1"
}
# also sources from zshrc
include ~/.bash_vars # also includes paths
include ~/.bashrc
include ~/.bash_private
include ~/.bash_aliases
include ~/.iterm2_shell_integration.$(basename $SHELL)

if [ -e /Users/me/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/me/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
