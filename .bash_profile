source ~/.bash_private

# Paths
export PATH=/Users/ssilesky/Library/Android/sdk/tools:$PATH
export PATH=$HOME/bin:$PATH
export ANDROID_HOME=/Users/ssilesky/Library/Android/sdk
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/opt/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load

# apps
alias vim='/usr/local/bin/vim'

alias haltall="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;"

alias git="/usr/local/Cellar/git/2.8.4/bin/git"
alias bashprof="vim ~/.bash_profile"
alias browser-syncit='browser-sync start --server --proxy --files . &'

alias srv="live-server"
alias check='git checkout'
alias log='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias killc="kill -9 `pgrep -f 'Google Chrome'`"
alias short="vim ~/shortcuts.txt"
alias catshort="cat ~/shortcuts.txt"
alias pb="pbpaste | pbcopy"
alias play='vim ~/Desktop/temp/play.js'


alias temp="cd '/Users/ssilesky/Desktop/temp/'"
alias sub="open -a '/Applications/Sublime Text.app'"

alias sourcebash="source ~/.bash_profile"
alias reprof="source ~/.bash_profile"
alias desk='cd ~/Desktop'
alias sublimesettings="cd '/Users/ssilesky/Library/Application Support/Sublime Text 3/Packages/User'"

# Projects

alias proj="cd '/Users/ssilesky/projects/'"

# ... devt-eslint
alias dvt="cd ~/projects/devt-eslint"

# ... practdroid
alias pcd="cd ~/projects/practdroid"
alias pcd.run="cd ~/projects/practdroid && react-native run-android"
alias pcd.emu="emulator -avd mydevice"

# ... coop

alias coop.ssh="cd /Users/ssilesky/projects/drupal-vm-master/ && vagrant ssh"
alias coop.up="cd /Users/ssilesky/projects/drupal-vm-master/ && vagrant up"
alias coop.1="cd /Users/ssilesky/projects/drupal-vm-master/"
alias coop.2="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/"
alias coop.themes="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/themes/"
alias coopla="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/themes/custom/coopla"


alias coop2.ssh="cd /Users/ssilesky/projects/drupal-vm-2/ && vagrant ssh"
alias coop2.up="cd /Users/ssilesky/projects/drupal-vm-2/ && vagrant up"
alias coop2.1="cd /Users/ssilesky/projects/drupal-vm-2/"
alias coop2.2="cd /Users/ssilesky/projects/coop-2/drupal/"

# ... wedding
alias wedding="cd ~/projects/wedding"

#...
alias pract="cd '/Users/ssilesky/projects/practicetimer'"
alias pract.app="cd /Users/ssilesky/projects/practicetimer/app"

alias blog="cd '/Users/ssilesky/projects/blog'"
alias sharon="cd '/Users/ssilesky/projects/sharon/docroot/public' && live-server . &"
alias drupalcamp="cd '/Users/ssilesky/drupalcampnola.com/'"
alias mr-dev="ssh tumrweb1d01.tulane.edu"
alias mr-prod="ssh tumrweb1p01.tulane.edu"
alias portfolio="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio'"
alias port-features="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/modules/features'"
alias sf-features="cd '/Users/ssilesky/projects/site-factory/docroot/sites/all/modules/features'"
alias rsync-port="rsync -azvh /Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/ /Users/ssilesky/projects/site-factory/docroot/sites/all/themes/portfolio/"
alias port="cd '/Users/ssilesky/projects/site-factory-portfolio/'"
alias bs-port="browser-sync start --proxy portfolio.dd:8083 --files '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/templates' --no-inject-changes"



alias v2="cd ~/projects/CooperationLouisiana.github.io/v2"



alias bashprof="sudo vim ~/.bash_profile"
alias catbash="cat ~/.bash_profile"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source ~/.bashrc
