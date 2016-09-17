# http://stackoverflow.com/questions/10735574/include-source-script-if-it-exists-in-bash
include () {
    [[ -f "$1" ]] && source "$1"
}
# .bash_profile
include ~/.paths
include ~/.bash_functions
include ~/.bash_proj
include ~/.bash_private
include ~/.bashrc
include ~/.bash_osx
include ~/.paths

# Vi mode
set -o vi

alias estest="eslint --debug ~/Desktop/temp/TimerBox.js"
# scripts
alias togglehidden="sudo sh ~/scripts/togglehidden.sh"
alias google="sh ~/scripts/google.sh"
alias autopush='sh ~/scripts/autopush.sh'
# Misc Folders
alias desk='cd ~/Desktop'
alias me="cd /Users/ssilesky/"
# Apps and Navigation, Misc
alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..'    # And for good measure
alias l='ls -lah'  # Long view, show hidden
alias ll='clear && ls -Afh' # Long view, show hidden + clear
alias la='ls -AF'   # Compact view, show hidden
cl() { clear && cd "$@" && ls -al; } #cdls
alias ed='ed -p" 🔥> "'
alias hs='history | grep'
alias catbash="ccat ~/.bash_profile"
alias cat="ccat"
alias mail.delete="sudo rm /var/mail/$USER"
alias c="clear"
alias rezsh="source ~/.zshrc && echo 'zshrc reloaded.'"
alias reprof="source ~/.bash_profile && echo 'bash reloaded.'"
alias reall="rezsh && reprof"
# ... text files
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
alias lynda="cd ~/Lynda/"


# ... git
alias gp="git push"
alias gac="git add -A && git commit"
alias ga="git add"
alias gc="git commit"
alias gs="git status -sb"
alias glo='git log --oneline'
alias gl='git log --graph --name-status --branches --decorate --abbrev-commit'
alias glm="git log --author='silesky' --branches --graph --name-status --abbrev-commit"

alias cc="clear"
alias gd="git difftool --gui &"

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
alias killc="kill -9 `pgrep -f 'Google Chrome'`" #osx


# OSX - app path realiases and os-specific
alias chrome="open -a /Applications/Google\ Chrome.app" #osx
alias git="/usr/local/bin/git" #osx
alias vim='/usr/local/bin/vim' #osx
alias sub="open -a '/Applications/Sublime Text.app'" #osx
alias play='cd ~/Desktop/temp/ && vim play.js'
# ... solarized
# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD #osx
export CLICOLOR=1 #osx

