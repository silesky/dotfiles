export VISUAL=vim
export EDITOR="$VISUAL"
# Include Drush bash customizations.
if [ -f "/Users/ssilesky/.drush/drush.bashrc" ] ; then
  source /Users/ssilesky/.drush/drush.bashrc
fi

# Include Drush completion.
if [ -f "/Users/ssilesky/.drush/drush.complete.sh" ] ; then
  source /Users/ssilesky/.drush/drush.complete.sh
fi

# Include Drush prompt customizations.
# if [ -f "/Users/ssilesky/.drush/drush.prompt.sh" ] ; then
  # source /Users/ssilesky/.drush/drush.prompt.sh
# * fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
