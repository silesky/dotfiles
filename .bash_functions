function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}


alarm() {
  (let secs=$((${1:-5}*60))
  let extrasecs=${2:-0}
  let total=$(($secs+extrasecs))
  echo "Alarm set for "$total" secs..."
  sleep $total && terminal-notifier -title "Alarm" -message "$1 minute alarm up!")&
}

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

