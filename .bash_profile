
# Paths
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=$HOME/bin:$PATH
export ANDROID_HOME=~/Library/Android/sdk
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/opt/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load

# apps
alias vim='/usr/local/bin/vim'

alias git="/usr/local/Cellar/git/2.8.4/bin/git"

alias browser-syncit='browser-sync start --server --proxy --files . &'

alias srv="live-server"
alias check='git checkout'
alias log='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias killc="kill -9 `pgrep -f 'Google Chrome'`"
alias short="vim ~/shortcuts.txt"
alias catshort="cat ~/shortcuts.txt"
alias pb="pbpaste | pbcopy"


alias temp="cd '/Users/ssilesky/Desktop/temp/'"
alias sub="sublime"
alias sublime="s"
alias sourcebash="source ~/.bash_profile"
alias desk='cd ~/Desktop'

# Projects


# ... coop
alias coop.ssh="cd /Users/ssilesky/projects/drupal-vm-master/ && vagrant ssh"
alias coop.up="cd /Users/ssilesky/projects/drupal-vm-master/ && vagrant up"
alias coop.1="cd /Users/ssilesky/projects/drupal-vm-master/"
alias coop.2="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/"
alias coop.themes="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/themes/"
alias coopla="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/themes/custom/coopla"
# ...
alias pract="cd '/Users/ssilesky/projects/practicetimer'"
alias proj="cd '/Users/ssilesky/projects/'"
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
