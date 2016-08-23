# .bash_profile
set -o vi
# ... mac

# if tmux isn't open, attach
tmux attach &> /dev/null

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# ... linux/bash
LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS


# Paths (general)
# It seems placing the $PATH at the end of the statement (export PATH=/usr/local/git/bin:$PATH)
# assures that the system looks in this custom place **before** searching default places
# (that is, the specified path is appended before the standard places contained within $PATH).

# path goes at the end in the default places, because I want the default places to go first.
export PATH=$HOME/bin:$PATH
export PATH=/opt/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# path goes at the beginning in the regular places, because I want them to go last
export ANDROID_HOME=/Users/ssilesky/Library/Android/sdk
export PATH=$PATH:/Users/ssilesky/Library/Android/sdk/tools
export PATH=$PATH:/Users/ssilesky/Library/Android/sdk/platform-tools #adb is here
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:/usr/local/share/dotnet

# misc folder shortcuts
alias desk='cd ~/Desktop'


# ......

# scripts
alias togglehidden="sudo sh ~/scripts/togglehidden.sh"

# Apps and Misc
alias mail.delete="sudo rm /var/mail/$USER"
alias seth="cd /Users/ssilesky/"
alias c="clear"
alias rezsh="source ~/.zshrc && echo 'zshrc reloaded.'"
alias reprof="source ~/.bash_profile && echo 'bash reloaded.'"
# ... text files
alias eslintrc="vim ~/.eslintrc"
alias nodemod="vim ~/.nodemodules.txt"
alias prof="vim ~/.bash_profile"
alias zshrc="vim ~/.zshrc"
alias inputrc="vim ~/.inputrc"
alias bashprof="vim ~/.bash_profile"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias cat="ccat"
alias autopush='sh ~/scripts/autopush.sh'
alias haltall="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;"
alias lynda="cd ~/Lynda/"
alias vim='/usr/local/bin/vim'
# ...

alias googler='googler'
alias google="sh ~/scripts/google.sh"

#... chrome
alias chrome="open -a /Applications/Google\ Chrome.app"

# ... git
alias gs="git status"
alias git="/usr/local/Cellar/git/2.8.4/bin/git"
alias git.s="git status"
alias git.log='git log --graph --decorate --pretty=oneline --abbrev-commit'

# git config --global color.ui auto
# git config --global color.branch auto
# git config --global color.status auto

# ... tmux
alias tm="tmux"
alias tm.ks="tmux kill-session -t"
alias tm.kw="tmux kill-window -t"
alias tm.a="tmux attach -t"
alias tmux.conf="vim ~/.tmux.conf"
alias tm.kill="kill -9 `pgrep -f tmux`"
# ... misc
alias browser-syncit='browser-sync start --server --proxy --files . &'


alias srv="live-server"
alias check='git checkout'
alias killc="kill -9 `pgrep -f 'Google Chrome'`"

alias play='cd ~/Desktop/temp/ && vim play.js'
cdls() { cd "$@" && ls; } #
alias sub="open -a '/Applications/Sublime Text.app'"


alias timeshark="ssh root@timeshark.sytes.net"
# Projects

alias proj="cd ~/proj/"


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
alias mr-dev="cd ~/projects/mr-dev"
alias mr-prod="cd ~/projects/mr-prod"
alias mrdiff="diff -rq ~/projects/mr-prod ~/projects/mr-dev"
alias mrdiff-view="colordiff -r ~/projects/mr-dev/application/views ~/projects/mr-prod/application/views"
alias mr-bs="browser-sync start --proxy='musicrisingdev.tulane.edu' --files ."


alias portfolio="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio'"
alias port-features="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/modules/features'"
alias sf-features="cd '/Users/ssilesky/projects/site-factory/docroot/sites/all/modules/features'"
alias rsync-port="rsync -azvh /Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/ /Users/ssilesky/projects/site-factory/docroot/sites/all/themes/portfolio/"
alias port="cd '/Users/ssilesky/projects/site-factory-portfolio/'"
alias bs-port="browser-sync start --proxy portfolio.dd:8083 --files '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/templates' --no-inject-changes"


alias v2="cd ~/projects/CooperationLouisiana.github.io/v2"

# colorized man pages
# https://gist.github.com/cocoalabs/2fb7dc2199b0d4bf160364b8e557eb66
man() {
    LESS_TERMCAP_mb=$'\e'"[1;31m" \
        LESS_TERMCAP_md=$'\e'"[1;31m" \
        LESS_TERMCAP_me=$'\e'"[0m" \
        LESS_TERMCAP_se=$'\e'"[0m" \
        LESS_TERMCAP_so=$'\e'"[1;44;33m" \
        LESS_TERMCAP_ue=$'\e'"[0m" \
        LESS_TERMCAP_us=$'\e'"[1;32m" \
        command man "$@"

}

# https://www.reddit.com/r/vim/comments/4xkyah/til_builtin_man_pager_in_vim/
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
alias bashprof="sudo vim ~/.bash_profile"
alias catbash="ccat ~/.bash_profile"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# mdless, googler
 source ~/.bash_private
 source ~/.bashrc
