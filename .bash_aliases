#!/usr/bin/env bash

# alias cd="z" # ALIAS CD to z
alias gitwatch="watch --color git -c color.status=always"

emacs() {
  # https://superuser.com/questions/303061/set-emacs-to-always-run-in-background
  # always run in background
  /usr/local/bin/emacs "$@" &
}
############################################
############### linux / osx #################
#############################################
if [[ "$(uname)" == "Darwin" ]]; then
  alias cat="ccat"
  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced
  alias chrome="open -a 'Google Chrome.app'"
  alias vim="/usr/local/bin/vim" # requires brew install vim for clipboard to work
  alias vi="vim"
  alias estest="eslint --debug ~/estest.js"
  alias tree="tree -C"
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home/
else
  alias pbcopy='xclip -selection clipboard'
  alias tmux="tmux -2"
  alias tm="tmux -2"
fi
# ..........................................
############################################
# kubernetes / kubectl
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/kubectl/kubectl.plugin.zsh

# display image names of all running containers
k.all-containers() {
  kubectl get pods --all-namespaces -o jsonpath="{..image}" |
    tr -s '[[:space:]]' '\n' |
    sort |
    uniq -c
}

kubectl-get-log-from-pod-name() {
  POD_NAME=$(kubectl get pods -l "app.kubernetes.io/name=flags-service,app.kubernetes.io/instance=flags-service" -o jsonpath="{.items[0].metadata.name}")
  kubectl logs $POD_NAME -c flags
}
alias k=kubectl
alias kaliases="cat ~/.oh-my-zsh/plugins/kubectl/README.md"
#########################################################################

# leafly
alias yarn-upgrade-fec="yarn upgrade @leafly-com/frontend-components --latest"
alias yarn-upgrade-webutils="yarn upgrade @leafly-com/web-utils --latest"
alias kgn="kubectl get namespaces"
alias klmp="kubectl -n lm-production"
alias ki="kubectl -n integration"
alias klmplogs="kubectl -n lm-production logs --follow"

alias npm-update-lnu="npm update @leafly-com/lm-node-utils --save"
alias npm-update-types="npm update @leafly-com/types --save"

# ... system
alias tm="tmux"
alias top="top -o cpu"

function copytasks() {
  cp -r ~/scripts/vscode/ .vscode
}
# gitkraken
function gitkr() {
  # usage: gitkr opens current
  local repo_path=${1-$(pwd)}
  open -na "GitKraken" --args -p "$repo_path"
}
alias kraken='gitkr'

# chrome
alias chrome.def='open -a "Google Chrome" --args --new-window --profile-directory="Default"'
alias chrome.pande='open -a "Google Chrome" --args --new-window --profile-directory="Profile 2"'
alias chrome.spr='open -a "Google Chrome" --args --new-window --profile-directory="Profile 3"'

# misc
alias dc="docker-compose"
alias ch="chokidar"

# npm
alias dev="npm run dev"
alias t="npm t"
alias tw="npm t -- --watch"
# curl - with response time
curlb() {
  curl -s -o /dev/null -w '%{time_starttransfer}\n' "$@"
}

## Docker alias
k9() { kill -9 "$(lsof -t -i:"$1")"; } # kill by port
k9p() { kill -9 "$(pgrep -f "$1")"; }  # kill by process name

alias co="code -r"
alias c="clear"
alias ka="killall"
alias bang="echo '#!/usr/bin/env bash'"

# scripts
alias sync-projects="bash ~/scripts/sync-projects-to-dropbox.sh"
alias togglehidden="sudo sh ~/scripts/togglehidden.sh"
alias google="sh ~/scripts/google.sh"
alias autopush='sh ~/scripts/autopush.sh'
# Misc Folders
alias ..='cd ..'     # Go up one directory
alias ...='cd ../..' # Go up two directories

alias l="ls"
alias lsd='ls -d */'
alias lsf="ls -al | grep '^[-l]'" # List files only

# ...  dotfiles
alias eslintrc="$EDITOR ~/.eslintrc"
alias bash_profile="$EDITOR ~/.bash_profile"
alias bashrc="$EDITOR ~/.bashrc"
alias bash_vars="$EDITOR ~/.bash_vars"
alias bash_aliases="$EDITOR ~/.bash_aliases"
alias bash_paths="$EDITOR ~/.bash_paths"
alias zshrc="$EDITOR ~/.zshrc"
alias inputrc="$EDITOR ~/.inputrc"
alias vimrc="vim ~/.vimrc"
alias gitconfig="$EDITOR ~/.gitconfig"
alias gitignore="$EDITOR ~/.gitignore"

# .... dotfiles
alias realias=". ~/.bash_aliases"
alias reprof=". ~/.zshrc"
alias blame="git blame-colored.sh"
alias plugins="ls ~/.oh-my-zsh/plugins ~/.oh-my-zsh/custom/plugins"

# misc
alias gitb="git checkout HEAD~"
alias gitf="git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout"
alias gshowhidden="git ls-files -v | grep '^[^H]'"
alias gshow="git show --color --pretty=format:%b"
alias gs="git status -sb"
alias gl="git l"

# ... tmux
alias tmA="tmux attach -d || tmux new"
alias tma="tmux attach -d -t"
alias tmd="tmux detach-client"
alias tmns="tmux new-session -s  $(date '+%H%M%S')"
alias mux="tmuxinator"
alias tmks="tmux kill-session -t"
alias tmkw="tmux kill-window -t"
alias tmux.conf="$EDITOR ~/.tmux.conf"
alias tm2="tmux splitw -d -h && clear"
alias tm3="bash ~/scripts/tm-grid-3.sh"
alias tm4="bash ~/scripts/tm-grid-4.sh"
alias tmkpa="tmux kill-pane -a -t . && clear"
alias tmkp="tmux kill-pane -t ."
alias tmx="tmux kill-session -t ."
alias tmX="killall tmux"

function tmnw() {
  local name=${1:-zsh}
  tmux new-window -n "$name"
}

# ... misc
alias bs="browser-sync"
alias bstart='browser-sync start --server --proxy --files . &'
alias srv="live-server"
alias haltall="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;"

# functions

#=========================
# e.g. branch feature/foo // branches foo from dev
#      branch feature/foo uat // branches foo from uat
branch() {
  local BASE=${2-master}
  git checkout $BASE
  git pull --ff-only
  git checkout -b $1
}
##########################

mergecheck() {
  let current_branch=git rev-parse --abbrev-ref HEAD | tr -d '\n'
  git format-patch $(git merge-base $current_branch $1)..$1 --stdout | git apply --check -
}

# easily create a script and make it executable
#   e.g. touchsh myscript
vimsh() { echo '#!/bin/sh' >$1.sh && chmod +x $1.sh && vim $1.sh; }

# easily bookmark current path,
#   e.g. a mybookmark
a() { alias $1="cd $PWD"; }

getpath() {
  (
    cd $(dirname $1)         # or  cd ${1%/*}
    echo $PWD/$(basename $1) # or  echo $PWD/${1##*/}
  )
}

alarm() {
  (
    let secs=$((${1:-5} * 60))
    let extrasecs=${2:-0}
    let total=$(($secs + extrasecs))
    echo "Alarm set for "$total" secs..."
    sleep $total && terminal-notifier -title "Alarm" -message "$1 minute alarm up!"
  ) &
}
