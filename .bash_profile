
# Paths
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=$HOME/bin:$PATH
export ANDROID_HOME=~/Library/Android/sdk
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/opt/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH


source ~/.bashrc
alias git="/usr/local/Cellar/git/2.8.4/bin/git"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load


alias desk='cd ~/Desktop'

alias browser-syncit='browser-sync start --server --proxy --files . &'
alias sharon="cd '/Users/ssilesky/projects/sharon/docroot/public' && live-server . &"

alias srv="live-server"
alias pract="cd '/Users/ssilesky/projects/practicetimer'"
alias check='git checkout'
alias log='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias killc="kill -9 `pgrep -f 'Google Chrome'`"
alias blog="cd '/Users/ssilesky/projects/blog'"
alias short="vim ~/shortcuts.txt"
alias catshort="cat ~/shortcuts.txt"
alias pb="pbpaste | pbcopy"
alias proj="cd '/Users/ssilesky/projects/'"
alias temp="cd '/Users/ssilesky/Desktop/temp/'"
alias drupalcamp="cd '/Users/ssilesky/drupalcampnola.com/'"
alias mr-dev="ssh tumrweb1d01.tulane.edu"
alias mr-prod="ssh tumrweb1p01.tulane.edu"
alias portfolio="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio'"
alias port-features="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/modules/features'"
alias sf-features="cd '/Users/ssilesky/projects/site-factory/docroot/sites/all/modules/features'"
alias rsync-port="rsync -azvh /Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/ /Users/ssilesky/projects/site-factory/docroot/sites/all/themes/portfolio/"
alias port="cd '/Users/ssilesky/projects/site-factory-portfolio/'"
alias sub="sublime"
alias sourcebash="source ~/.bash_profile"
alias bs-port="browser-sync start --proxy portfolio.dd:8083 --files '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/templates' --no-inject-changes"

# Coop Louisiana
alias vagrant-coop="cd /Users/ssilesky/projects/drupal-vm-master && vagrant up"
alias coop="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/themes/custom/coop"
alias coopla="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/themes/custom/coopla"
alias coopla-watch="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/themes/custom/coopla && sass --watch assets/_sass:assets/css &"
alias v2="cd ~/projects/CooperationLouisiana.github.io/v2"



alias bashprof="sudo vim ~/.bash_profile"
alias catbash="cat ~/.bash_profile"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias vim='/usr/local/bin/vim'
