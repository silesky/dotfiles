# ALIASES
alias doc="cd ~/Documents"
alias mde="cd ~/Dropbox/Apps/Markdown\ to\ Evernote/"
alias stopm="kill -9 `pgrep -f mongod`"
alias bang="echo '/usr/bin/env bash'"
alias estest="eslint --debug ~/estest.js"
# scripts
alias togglehidden="sudo sh ~/scripts/togglehidden.sh"
alias google="sh ~/scripts/google.sh"
alias autopush='sh ~/scripts/autopush.sh'
# Misc Folders
alias desk='cd ~/Desktop'
alias me="cd /Users/ssilesky/"
# Apps and Navigation, Misc
alias f="find . -iname"
alias sqlpro="open -a 'Sequel Pro'"
# a() { ag -ro "$1" * }
# g() { sudo grep --color=always -r "$1" . }

alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..'    # And for good measure
alias l='ls -A'  # Long view, show hidden
alias ll='clear && ls -al' # Long view, show hidden + clear
alias la='ls -AF'   # Compact view, show hidden
cl() { clear && cd "$@" && ls -al; } #cdls
alias hs='history | grep'
alias as='alias | grep'
alias mail.delete="sudo rm /var/mail/$USER"
alias c="clear"
alias rezsh="source ~/.zshrc && echo 'zshrc reloaded.'"
alias reprof="source ~/.bash_profile && echo 'bash reloaded.'"
alias reall="rezsh && reprof"

# ... text files
alias .sass-lint="vim ~/.sass-lint.yml"
alias eslintrc="vim ~/.eslintrc"
alias nodemod="vim ~/.nodemodules.txt"
alias bash_proj="vim ~/.bash_proj"
alias bash_functions="vim ~/.bash_functions"
alias paths="vim ~/.paths"

# .... Git
alias gitconfig="vim ~/.gitconfig"
alias gitignore="vim ~/.gitignore"
alias prof="vim ~/.bash_profile"
alias aliases="vim ~/.bash_aliases"
alias als="vim ~/.bash_aliases"
alias zshrc="vim +/plugins ~/.zshrc"
alias inputrc="vim ~/.inputrc"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias plugins="ls ~/.oh-my-zsh/plugins ~/.oh-my-zsh/custom/plugins"
# misc
alias haltall="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;"
alias lynda="cd ~/Lynda/"
alias rp="realpath"

# ... git
alias gpk="git cherry-pick"
alias gp="git push"
alias gac="git add -A && git commit"
alias ga="git add"
alias gc="git commit"
alias gck.="git checkout -- ."
alias gck="git checkout"
alias gs="git status -sb"
alias gst="git status"
alias gl='git log --oneline'
alias gck='git checkout'
alias glm="git log --author='silesky' --branches --graph --name-status --abbrev-commit"
alias gd="git difftool --gui &"
# gb () { ruby ~/scripts/git-blame-colored.sh $1 | less -R }


# ... tmux
alias tm.a="tmux attach -t base || tmux new -s 'base'"
alias mux="tmuxinator"
alias tms="tmux splitw"
alias tmsd="tmux splitw -d"
alias tmsv="tmux splitw -v"
alias tmsh="tmux splitw -h"
alias tml="tmux ls"
alias tmk="tmux kill-session -t"
alias tmkw="tmux kill-window -t"
alias tma="tmux attach -t"
alias tmux.conf="vim ~/.tmux.conf"
alias tm2="tmux splitw -d -h && clear"
alias tm3="bash ~/scripts/tm-grid-3.sh"
alias tm4="bash ~/scripts/tm-grid-4.sh"
alias tmkpa="tmux kill-pane -a -t . && clear"
alias tmx="killall tmux"
# ... misc
alias bs="browser-sync"
alias bstart='browser-sync start --server --proxy --files . &'
alias srv="live-server"
alias gitkr="gitkraken"
#############################################
############### linux / osx #################
#############################################
if [[ "$(uname)" = "Darwin" ]]; then
   alias cat="ccat"
   alias ca="cat"
   export CLICOLOR=1
   export LSCOLORS=GxFxCxDxBxegedabagaced
   alias tm="tmux"
   # OSX - app path realiases and os-specific
   alias chrome="open -a /Applications/Google\ Chrome.app" #osx
   alias gitkraken="open -a gitkraken"
   alias vim='/usr/local/bin/vim -p' #osx
   alias sub="open -a '/Applications/Sublime Text.app'" #osx
   alias play='cd ~/Desktop/temp/ && vim play.js'
   alias temp='cd ~/Desktop/temp'
   alias tree='tree -C'
else
   alias tmux='tmux -2'
   alias tm="tmux -2"
fi
# ..........................................
############################################

