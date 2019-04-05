#!/bin/bash
############################################
############### linux / osx #################
#############################################
if [[ "$(uname)" = "Darwin" ]]; then
   alias cat="ccat"
   export CLICOLOR=1
   export LSCOLORS=GxFxCxDxBxegedabagaced
   alias tm="tmux"
   # OSX - app path realiases and os-specific
   alias chrome="open -a 'Google Chrome.app'"
   alias vim="/usr/local/bin/vim" # requires brew install vim for clipboard to work
   alias vi="vim"
   alias v="vim"
   alias estest="eslint --debug ~/estest.js"
   alias temp="cd ~/Desktop/temp"
   alias tree="tree -C"
else
   alias tmux="tmux -2"
   alias tm="tmux -2"
fi
# ..........................................
############################################
# kubernetes / kubectl
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/kubectl/kubectl.plugin.zsh
getLog() {
   POD_NAME=$(kubectl get pods -l "app.kubernetes.io/name=flags-service,app.kubernetes.io/instance=flags-service" -o jsonpath="{.items[0].metadata.name}")
   kubectl logs $POD_NAME -c flags
}
alias ksys="kubectl --namespace=kube-system"

alias kg="kubectl get"
alias kgsys="kubectl get --namespace=kube-system"

alias kgpa="kubectl get pods --all-namespaces"
alias kgpsys="kubectl get pods --namespace=kube-system"

alias kd="kubectl describe"
alias kdsys="kubectl describe --namespace=kube-system"

alias ke="kubectl edit"
alias kesys="kubectl edit --namespace=kube-system"


# misc
alias ai="autoenv_init"
alias dc="docker-compose"
alias sub="open -a 'Sublime Text'"
alias timeshark="ssh -Y root@timeshark.org"

## Docker alias
k9bp() { kill -9 "$(lsof -t -i:"$1")"; } # kill by port
k9p() { kill -9 "$(pgrep -f "$1")"; }
alias co="code"
alias code.settings="code '/Users/me/Library/Application Support/Code/User/settings.json'"
alias code="'/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'"
alias k9="k9p"
alias kb="kbox"
alias rn="react-native"
alias ka="killall"
alias rnl="react-native link"
alias rnri="react-native run-ios"
alias rnra="react-native run-android"
alias dockerq="source /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh"
alias doc="cd ~/Documents"
alias mongo-start=". ~/scripts/mongo-start.sh"
alias stopm="kill -9 `pgrep -f mongod`"
alias bang="echo '#!/usr/bin/env bash'"

# scripts
alias togglehidden="sudo sh ~/scripts/togglehidden.sh"
alias google="sh ~/scripts/google.sh"
alias autopush='sh ~/scripts/autopush.sh'
# Misc Folders

# a() { ag -ro "$1" * }
# g() { sudo grep --color=always -r "$1" . }

alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories

alias l="ls"
alias ls/='ls -ld */'
alias ls.='ls -ld .*' #List dotfiles only
alias ll='clear && ls -al' # Long view, show hidden + clear
cl() { clear && cd "$@" && ls -al; } #cdls

# ...  dotfiles
alias eslintrc="$EDITOR ~/.eslintrc"
alias nodemod="$EDITOR ~/.nodemodules.txt"
alias bash_proj="$EDITOR ~/.bash_proj"
alias bash_profile="$EDITOR ~/.bash_profile"
alias prof=$bash_profile
alias bashrc="$EDITOR ~/.bashrc"
alias bash_functions="$EDITOR ~/.bash_functions"
alias bash_vars="$EDITOR ~/.bash_vars"
alias vars=$bash_vars
alias bash_aliases="$EDITOR ~/.bash_aliases"
alias als="$EDITOR ~/.bash_aliases"
alias bash_paths="$EDITOR ~/.bash_paths"
alias paths=$bash_paths
alias zshrc="$EDITOR ~/.zshrc"
alias inputrc="$EDITOR ~/.inputrc"
alias vimrc="vim ~/.vimrc"
alias gitconfig="$EDITOR ~/.gitconfig"
alias gitignore="$EDITOR ~/.gitignore"

# .... dotfiles
alias rezsh="source ~/.zshrc && echo 'zshrc reloaded.'"
alias reprof=". ~/.bash_profile && echo 'profile reloaded.'"
alias reall="rezsh && reprof"
alias blame="git blame-colored.sh"

alias plugins="ls ~/.oh-my-zsh/plugins ~/.oh-my-zsh/custom/plugins"
# misc
alias haltall="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;"
alias lynda="cd ~/Lynda/"
alias rp="realpath"

# npm
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nt='npm test'
alias nit='npm install && npm test'
alias nk='npm link'
alias nr='npm run'
alias ns='npm start'
alias nf='npm cache clean && rm -rf node_modules && npm install'
alias nlg='npm list --global --depth=0'

# ... git
alias gitb="git checkout HEAD~"
alias gitf="git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout"
alias gshowhidden="git ls-files -v | grep '^[^H]'"
alias gshow="git show --color --pretty=format:%b"
alias gr="git reset"
alias grb="git rebase"
alias gm="git merge"
alias gpk="git cherry-pick"
alias gp="git push"
alias ga="git add"
alias gc="git commit"
alias gcam="git commit --amend"
alias gcnv="git commit --no-verify"
alias gck.="git checkout -- ."
alias gck="git checkout"
alias gs="git status -sb"
alias gst="git status"
alias gl="git l"
alias gck='git checkout'
alias gdt="git difftool"
alias gd="git diff"
alias gdc="git diff --cached"
alias git-changed="git whatchanged -n 10 | grep -v Author | grep -o 'M.*\|A.*' | awk '{print $NF}' | uniq"

# ... tmux
alias tmA="tmux attach -d || tmux new"
alias tma="tmux attach -d -t"
alias tmd="tmux detach-client"
alias tmns="tmux new-session -s  `date '+%H%M%S'`"
alias mux="tmuxinator"
alias tmsw="tmux splitw"
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
# ... misc
alias bs="browser-sync"
alias bstart='browser-sync start --server --proxy --files . &'
alias srv="live-server"
alias gitkr="gitkraken"
alias top="top -o cpu"
