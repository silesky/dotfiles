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
pman() {
    man -t ${@} | open -f -a /Applications/Preview.app/
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

dedupe() { nl "$1" | sort -k 2  -k 1,1nr | uniq -f 1 | sort -n |
          cut -f 2 > ~/dedupe && cp ~/dedupe "$1"; }

chrome() { open -a "Google Chrome" --args "$1" }

chrome.devt() { open -a "Google Chrome" --args "$1" --profile-directory="Profile 2" }

alias gh=GitHub
function GitHub()
{
    if [ ! -d .git ] ;
        then echo "ERROR: This isnt a git directory" && return false;
    fi

    git_url=`git config --get remote.origin.url`
    git_domain=`echo $git_url | awk -v FS="(@|:)" '{print $2}'`
    git_branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`

    if [[ $git_url == https://* ]];
    then
        url=${git_domain}/${git_url%.git}/tree/${git_branch}
    else
       if [[ $git_url == git@* ]]
       then
            url="https://${git_domain}/${${git_url#*:}%.git}/tree/${git_branch}"
            echo $url
            open "$url"
       else
           echo "ERROR: Remote origin is invalid" && return false;
       fi
    fi
}

ask() {
    # https://djm.me/ask
    local prompt default REPLY

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}
