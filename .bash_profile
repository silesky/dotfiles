source ~/.paths
source ~/.bash_functions
source ~/.bash_private
source ~/.bashrc

# .bash_profile

set -o vi

# ... colors: mac only (can't use ls --colors=auto)
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export CLICOLOR=1
# ......

alias estest="eslint --debug ~/Desktop/temp/TimerBox.js"
# scripts
alias togglehidden="sudo sh ~/scripts/togglehidden.sh"
alias google="sh ~/scripts/google.sh"
alias autopush='sh ~/scripts/autopush.sh'


# misc folder shortcuts
alias desk='cd ~/Desktop'

# Apps and Misc
alias ed='ed -p" 🔥> "'
alias hs='history | grep'
alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..'    # And for good measure
alias l='ls -lah'  # Long view, show hidden
alias la='ls -AF'   # Compact view, show hidden
alias ll='ls -lFh'  # Long view, no hidden
alias catbash="ccat ~/.bash_profile"
alias cat="ccat"
alias mail.delete="sudo rm /var/mail/$USER"
alias me="cd /Users/ssilesky/"
alias c="clear"
alias rezsh="source ~/.zshrc && echo 'zshrc reloaded.'"
alias reprof="source ~/.bash_profile && echo 'bash reloaded.'"
alias reall="rezsh && reprof"
# ... text files
alias eslintrc="vim ~/.eslintrc"
alias nodemod="vim ~/.nodemodules.txt"
alias bash_functions="vim ~/.bash_functions"
alias paths="vim ~/.paths"
alias prof="vim ~/.bash_profile"
alias zshrc="vim +/plugins ~/.zshrc"
alias inputrc="vim ~/.inputrc"
alias bashprof="vim ~/.bash_profile"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias plugins="ls ~/.oh-my-zsh/plugins ~/.oh-my-zsh/custom/plugins"
alias haltall="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;"
alias lynda="cd ~/Lynda/"
alias vim='/usr/local/bin/vim'
#... chrome
alias chrome="open -a /Applications/Google\ Chrome.app"
# ... git
alias gs="git status -sb"
alias git="/usr/local/bin/git"
alias git.log='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias cc="clear"

# git config --global color.ui auto
# git config --global color.branch auto
# git config --global color.status auto

# ... tmux
alias tm="tmux"
alias tm.swc="tmux switch-client -t"
alias tm.ks="tmux kill-session -t"
alias tm.kw="tmux kill-window -t"
alias tm.a="tmux attach -t"
alias tmux.conf="vim ~/.tmux.conf"
alias tm.kill="kill -9 `pgrep -f tmux`"
alias tm.3="bash ~/scripts/tm-grid-3.sh"
alias tm.4="bash ~/scripts/tm-grid-4.sh"
alias tm.kpa="tmux kill-pane -a -t . && clear"
alias tm.x="killall tmux"
# ... misc
alias browser-syncit='browser-sync start --server --proxy --files . &'

alias srv="live-server"
alias check='git checkout'
alias killc="kill -9 `pgrep -f 'Google Chrome'`"

alias play='cd ~/Desktop/temp/ && vim play.js'
cdls() { cd "$@" && ls; } #
alias sub="open -a '/Applications/Sublime Text.app'"

# Projects
# ... misc
alias blog="cd '/Users/ssilesky/projects/blog'"
alias sharon="cd '/Users/ssilesky/projects/sharon/docroot/public' && live-server . &"
alias drupalcamp="cd '/Users/ssilesky/drupalcampnola.com/'"
alias timeshark="ssh root@timeshark.sytes.net"
alias proj="cd ~/projects/"
#... dan
alias dan="cd ~/projects/danrico87.github.io"
# ... devt-eslint
alias dvt="cd ~/projects/devt-eslint"
# ... pract-net
alias pcn="cd ~/projects/pract-net"
alias pcn.run="cd ~/projects/pract-net/WebApplication && dotnet run"
# ... jsmobile
alias jsm="cd ~/projects/JSMobile"
alias jsm.run="cd ~/projects/JSMobile && npm start"
alias jsm.emu="emulator -avd mydevice"
alias rn.kill="kill -9 `pgrep -f /Users/ssilesky/Library/Android/sdk/` && kill -9 `pgrep -f genymotion`"
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
#... pct
alias pract="cd '/Users/ssilesky/projects/practicetimer'"
alias pract.app="cd /Users/ssilesky/projects/practicetimer/app"
#... Music Rising
alias mr-dev="cd ~/projects/mr-dev"
alias mr-prod="cd ~/projects/mr-prod"
alias mrdiff="diff -rq ~/projects/mr-prod ~/projects/mr-dev"
alias mrdiff-view="colordiff -r ~/projects/mr-dev/application/views ~/projects/mr-prod/application/views"
alias mr-bs="browser-sync start --proxy='musicrisingdev.tulane.edu' --files ."
#... portfolio
alias portfolio="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio'"
alias port-features="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/modules/features'"
alias sf-features="cd '/Users/ssilesky/projects/site-factory/docroot/sites/all/modules/features'"
alias rsync-port="rsync -azvh /Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/ /Users/ssilesky/projects/site-factory/docroot/sites/all/themes/portfolio/"
alias bs-port="browser-sync start --proxy portfolio.dd:8083 --files '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/templates' --no-inject-changes"
alias v2="cd ~/projects/CooperationLouisiana.github.io/v2"
