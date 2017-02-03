### .bashrc
export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTCONTROL=ignoredups:erasedups
export VISUAL=mvim
export EDITOR="$VISUAL"
export EVENT_NOKQUEUE=1 #fix for broken kqueue message in tmux`
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

export PATH="$PATH:/Applications/DevDesktop/tools"

# added by travis gem
[ -f /Users/ssilesky/.travis/travis.sh ] && source /Users/ssilesky/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source $(brew --prefix php-version)/php-version.sh && php-version 7
