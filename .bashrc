### .bashrc
# bash-specific variables -- a lot of this overlaps with ~/.bash_paths


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/Users/me/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/me/.sdkman/bin/sdkman-init.sh"

