#############################################
############### linux / osx #################
#############################################
if [[ "$(uname)" = "Darwin" ]]; then
   alias cat="ccat"
   export CLICOLOR=1
   export LSCOLORS=GxFxCxDxBxegedabagaced
   alias tm="tmux"
   # OSX - app path realiases and os-specific
   alias chrome="open -a /Applications/Google\ Chrome.app" #osx
   alias chr="chrome"
   alias pbc="pbcopy"
   alias gitkraken="open -a gitkraken"
   alias vim="/usr/local/bin/vim -p" #osx
   alias v="vim"
   alias vi="vim"
   alias vv="mvim" #osx
   alias vvim="mvim"
   alias sub="open -a '/Applications/Sublime Text.app'" #osx
   alias play="cd ~/Desktop/temp/ && vim play.js"
   alias estest="eslint --debug ~/estest.js"
   alias temp="cd ~/Desktop/temp"
   alias tree="tree -C"
else
   alias vvim="gvim"
   alias tmux="tmux -2"
   alias tm="tmux -2"
fi
# ..........................................
############################################
# misc
## https://github.com/AmazeeLabs/amazee-dotfiles/blob/master/bash_aliases
## Docker alias
alias aio=amazeeio-cachalot
alias dssh='docker-compose exec --user drupal drupal bash'
alias dstopall='docker stop $(docker ps -a -q)'
alias dup='docker-compose up -d'
alias dstop='docker-compose stop'


alias devdesktop='export PHP_ID=php7_0; export PATH="/Applications/DevDesktop/$PHP_ID/bin:/Applications/DevDesktop/mysql/bin:/Applications/DevDesktop/tools:$PATH"'
alias ask="sh ~/scripts/ask.sh"
k9bp() { kill -9 $(lsof -t -i:$1); } # kill by port
k9p() { kill -9 `pgrep -f "$1"`; }
alias co="code"
alias code.settings="code '/Users/me/Library/Application Support/Code/User/settings.json'"
alias dn="dotnet"
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
alias bang="echo '/usr/bin/env bash'"
# scripts
alias togglehidden="sudo sh ~/scripts/togglehidden.sh"
alias google="sh ~/scripts/google.sh"
alias autopush='sh ~/scripts/autopush.sh'
# Misc Folders
alias desk='cd ~/Desktop'
alias me="cd /Users/ssilesky/"
# Apps and Navigation, Misc
alias f="find * -iname"

# a() { ag -ro "$1" * }
# g() { sudo grep --color=always -r "$1" . }

alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..'    # And for good measure
alias l='ls -a'  # Long view, show hidden
alias lsd='ls -d */'
alias ldot='ls -d .*' #List dotfiles only
alias ll='clear && ls -al' # Long view, show hidden + clear
alias la='ls -AF'   # Compact view, show hidden
cl() { clear && cd "$@" && ls -al; } #cdls
alias hs='history | grep'
alias as='alias | grep'
alias mail.delete="sudo rm /var/mail/$USER"
alias c="clear"

# ... text files
alias .sass-lint="$EDITOR ~/.sass-lint.yml"
alias eslintrc="$EDITOR ~/.eslintrc"
alias nodemod="$EDITOR ~/.nodemodules.txt"
alias bash_proj="$EDITOR ~/.bash_proj"
alias bashpj="bash_proj"
alias bash_functions="$EDITOR ~/.bash_functions"
alias paths="$EDITOR ~/.paths"

# .... dotfiles
alias rezsh="source ~/.zshrc && echo 'zshrc reloaded.'"
alias reprof=". ~/.bash_profile && echo 'profile reloaded.'"
alias reall="rezsh && reprof"
alias bash_="$EDITOR ~/.bash_*"
alias vars="$EDITOR ~/.bash_vars"
alias paths="$EDITOR ~/.bash_paths"
alias gitconfig="$EDITOR ~/.gitconfig"
alias gitignore="$EDITOR ~/.gitignore"
alias prof="$EDITOR ~/.bash_profile"
alias aliases="$EDITOR ~/.bash_aliases"
alias als="$EDITOR ~/.bash_aliases"
alias zshrc="$EDITOR ~/.zshrc"
alias inputrc="$EDITOR ~/.inputrc"
alias bashrc="$EDITOR ~/.bashrc"
alias vimrc="vim ~/.vimrc"
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
alias gpk="git cherry-pick"
alias gp="git push"
alias gac="git add -A && git commit"
alias ga="git add"
alias gc="git commit"
alias gcam="git commit --amend"
alias gck.="git checkout -- ."
alias gck="git checkout"
alias gs="git status -sb"
alias gst="git status"
alias glp="git log -p"
alias gl="git log --stat --pretty=format:'%C(red)%h%Creset - %C(yellow)%s%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glo="git log --oneline"
alias gck='git checkout'
alias gdt="git difftool"
alias gd="git diff"
alias gdc="git diff --cached"
# gb () { ruby ~/scripts/git-blame-colored.sh $1 | less -R }
alias pd="pretty-diff ^head"
alias tower="gittower"
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

