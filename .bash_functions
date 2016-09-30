#!/bin/sh
getpath() {
  (
  cd $(dirname $1)         # or  cd ${1%/*}
  echo $PWD/$(basename $1) # or  echo $PWD/${1##*/}
  )
}

w3g() {
 w3m 'google.com/search?q="'$1'"'
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


extract() {
     if [ -f $1 ] ; then
         case $1 in
            *.tar.bz2)
                tar xvjf $1
                ;;
            *.tar.gz)
                tar xvzf $1
                ;;
            *.bz2)
                bunzip2 $1
                ;;
            *.rar)
                unrar x $1
                ;;
            *.gz)
                gunzip $1
                ;;
            *.tar)
                tar xvf $1
                ;;
            *.tbz2)
                tar xvjf $1
                ;;
            *.tgz)
                tar xvzf $1
                ;;
            *.zip)
                unzip $1
                ;;
            *.Z)
                uncompress $1
                ;;
            *.7z)
                7z x $1
                ;;
            *)
                echo "'$1' cannot be extracted via extract"
                ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
