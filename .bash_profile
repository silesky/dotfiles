### .bash_profile

source ~/.bash_private

# make readline behave like vim
 set -o vi

# Paths (general)

export PATH=$HOME/bin:$PATH
export PATH=/opt/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH=/Users/ssilesky/Library/Android/sdk/tools:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/usr/local/share/dotnet:$PATH
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load
export ANDROID_HOME=/Users/ssilesky/Library/Android/sdk:$PATH
# Apps and Misc
alias prof="vim ~/.bash_profile"
alias bashprof="vim ~/.bash_profile"
alias vimrc="vim ~/.vimrc"


alias autopush='sh ~/autopush.sh'
alias haltall="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;"
alias lynda="cd ~/Lynda/"
alias dash="open dash://"
alias vim='/usr/local/bin/vim'
alias goog='googler'


#... chrome
alias chrome="open -a /Applications/Google\ Chrome.app"

# ... git
alias git="/usr/local/Cellar/git/2.8.4/bin/git"
alias st="git status"
# git config --global color.ui auto
# git config --global color.branch auto
# git config --global color.status auto

# ... tmux
alias tm.ks="tmux kill-session -t"
alias tm="tmux"
alias tmux.conf="vim ~/.tmux.conf"

# ... misc
alias browser-syncit='browser-sync start --server --proxy --files . &'

alias srv="live-server"
alias check='git checkout'
alias log='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias killc="kill -9 `pgrep -f 'Google Chrome'`"
alias short="vim ~/shortcuts.txt"

alias catshort="cat ~/shortcuts.txt"
alias pb="pbpaste | pbcopy"
alias play='cd ~/Desktop/temp/ && vim play.js'
cdls() { cd "$@" && ls; } #
alias temp="cd '/Users/ssilesky/Desktop/temp/'"
alias sub="open -a '/Applications/Sublime Text.app'"

alias sourcebash="source ~/.bash_profile"
alias reprof="source ~/.bash_profile"
alias desk='cd ~/Desktop'
alias sublimesettings="cd '/Users/ssilesky/Library/Application Support/Sublime Text 3/Packages/User'"

# Projects

alias proj="cd '/Users/ssilesky/projects/'"


#... dan
alias dan="cd ~/projects/dan"
# ... devt-eslint
alias dvt="cd ~/projects/devt-eslint"

# ... pract-net
alias pcn="cd ~/projects/pract-net"
alias pcn.run="cd ~/projects/pract-net/WebApplication && dotnet run"

# ... practdroid
alias pcd="cd ~/projects/practdroid"
alias pcd.run="cd ~/projects/practdroid && react-native run-android"
alias pcd.emu="emulator -avd mydevice"
# alias pcd.emu="/Applications/Genymotion.app/Contents/MacOS/genymotion"
alias pcd.runall="source ~/.bash_profile && cd ~/projects/practdroid
&& pcd.emu & sleep 20s; pcd.run &"
alias pcd.kill="kill -9 `pgrep -f /Users/ssilesky/Library/Android/sdk/` && kill -9 `pgrep -f genymotion`"
alias pcd.sync="rsync -ar ~/projects/practicetimer/ ~/projects/practdroid/webapp/"


# ... coop

alias coop.ssh="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal-vm-master/ && vagrant ssh && coop.1"
alias coop.up="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal-vm-master/ && vagrant up && coop.2"
alias coop.reload="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal-vm-master/ && vagrant reload"
alias coop.vm="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal-vm-master/"
alias coop.root="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/"
alias coop="cd /Users/ssilesky/projects/cooperationlouisiana.com/"
alias coop.coop="cd /Users/ssilesky/projects/cooperationlouisiana.com/drupal/themes/coop"



alias coop2.ssh="cd /Users/ssilesky/projects/drupal-vm-2/ && vagrant ssh"
alias coop2.up="cd /Users/ssilesky/projects/drupal-vm-2/ && vagrant up"
alias coop2.vm="cd /Users/ssilesky/projects/drupal-vm-2/"
alias coop2="cd /Users/ssilesky/projects/coop-2"
alias coop2.root="cd /Users/ssilesky/projects/coop-2/drupal/"

# ... wedding
alias wedding="cd ~/projects/wedding"

#...
alias pract="cd '/Users/ssilesky/projects/practicetimer'"
alias pract.app="cd /Users/ssilesky/projects/practicetimer/app"

alias blog="cd '/Users/ssilesky/projects/blog'"
alias sharon="cd '/Users/ssilesky/projects/sharon/docroot/public' && live-server . &"
alias drupalcamp="cd '/Users/ssilesky/drupalcampnola.com/'"

#... Music Rising
alias mr-dev="ssh tumrweb1d01.tulane.edu"
alias mr-prod="ssh tumrweb1p01.tulane.edu"
alias mrdiff="diff -rq ~/projects/mr-prod ~/projects/mr-dev"
alias mrdiff-view="colordiff -r ~/projects/mr-dev/application/views ~/projects/mr-prod/application/views"

alias portfolio="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio'"
alias port-features="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/modules/features'"
alias sf-features="cd '/Users/ssilesky/projects/site-factory/docroot/sites/all/modules/features'"
alias rsync-port="rsync -azvh /Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/ /Users/ssilesky/projects/site-factory/docroot/sites/all/themes/portfolio/"
alias port="cd '/Users/ssilesky/projects/site-factory-portfolio/'"
alias bs-port="browser-sync start --proxy portfolio.dd:8083 --files '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/templates' --no-inject-changes"



alias v2="cd ~/projects/CooperationLouisiana.github.io/v2"



alias bashprof="sudo vim ~/.bash_profile"
alias catbash="ccat ~/.bash_profile"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# mdless, googler

source ~/.bashrc
