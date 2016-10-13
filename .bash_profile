# http://stackoverflow.com/questions/10735574/include-source-script-if-it-exists-in-bash
include () {
    # stuff
    [[ -f "$1" ]] && source "$1"
}
# .bash_profile
include ~/.path
include ~/.bash_functions
include ~/.bash_proj
include ~/.bash_private
include ~/.bashrc
include ~/.bash_osx

# vi mode
set -o vi
alias clip="xclip -sel clip < "
alias gitkr="gitkraken &"
alias shebang="#!/usr/bin/env bash"
alias estest="eslint --debug ~/estest.js"
alias estest="eslint --debug ~/estest.js"
# scripts
alias togglehidden="sudo sh ~/scripts/togglehidden.sh"
alias google="sh ~/scripts/google.sh"
alias autopush='sh ~/scripts/autopush.sh'
# misc folders
alias desk='cd ~/desktop'
alias me="cd /users/ssilesky/"
# apps and navigation, misc
alias ..='cd ..'            # go up one directory
alias ...='cd ../..'        # go up two directories
alias ....='cd ../../..'    # and for good measure
alias l='ls -afh'  # long view, show hidden
alias ll='clear && ls -lafh' # long view, show hidden + clear
alias la='ls -af'   # compact view, show hidden
cl() { clear && cd "$@" && ls -al; } #cdls
alias ed='ed -p" 🔥> "'
alias hs='history | grep'
alias as='alias | grep'
alias catbash="ccat ~/.bash_profile"
alias cat="ccat"
alias mail.delete="sudo rm /var/mail/$user"
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
alias gitconfig="vim ~/.gitconfig"
alias gitignore="vim ~/.gitignore"
alias prof="vim ~/.bash_profile"
alias zshrc="vim +/plugins ~/.zshrc"
alias inputrc="vim ~/.inputrc"
alias bashprof="vim ~/.bash_profile"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias plugins="ls ~/.oh-my-zsh/plugins ~/.oh-my-zsh/custom/plugins"
# misc
alias haltall="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;"
alias lynda="cd ~/lynda/"


# ... git
alias gp="git push"
alias gac="git add . && git commit"
alias ga="git add"
alias gc="git commit"
alias gs="git status -sb"
alias gst="git status"
alias glo='git log --oneline'
alias gl='git log --graph --name-status --branches --decorate --abbrev-commit'
alias glm="git log --author='silesky' --branches --graph --name-status --abbrev-commit"
alias gd="git difftool --gui &"

gb () {
    ruby ~/scripts/git-blame-colored.sh $1 | less -r
}


# ... tmux
alias tm.sw="tmux splitw -d"
alias tm.ks="tmux kill-session -t"
alias tm.kw="tmux kill-window -t"
alias tm.a="tmux attach -t"
alias tmux.conf="vim ~/.tmux.conf"
alias tm.kill="kill -9 `pgrep -f tmux`"
alias tm.2="tmux splitw -d -h && clear"
alias tm.3="bash ~/scripts/tm-grid-3.sh"
alias tm.4="bash ~/scripts/tm-grid-4.sh"
alias tm.kpa="tmux kill-pane -a -t . && clear"
alias tm.x="killall tmux"

# ... misc
alias browser-syncit='browser-sync start --server --proxy --files . &'
alias srv="live-server"

 # linux / osx
if [[ "$(uname)" = "darwin" ]]; then
    alias tm="tmux"
    # osx - app path realiases and os-specific
    alias chrome="open -a /applications/google\ chrome.app" #osx
    alias git="/usr/local/bin/git" #osx
    alias vim='/usr/local/bin/vim' #osx
    alias sub="open -a '/applications/sublime text.app'" #osx
    alias play='cd ~/desktop/temp/ && vim play.js'
    # ... solarized
    # https://github.com/seebi/dircolors-solarized/issues/10
    export lscolors=gxfxbeaebxxehehbadacad #osx
    export clicolor=1 #osx
else
    alias sub='subl'
    alias tmux='tmux -2'
    alias tm="tmux -2"
fi
alias python="python3"
