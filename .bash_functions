#!/bin/sh

# display image names of all running containers
k.all-containers() {
  kubectl get pods --all-namespaces -o jsonpath="{..image}" |\
  tr -s '[[:space:]]' '\n' |\
  sort |\
  uniq -c
}
#=========================
branch() {
  local BASE=dev
  git fetch origin $BASE;
  git branch $1 --no-track $BASE;
  git checkout $1;
}
##########################


# convert a json path to a .env
jsonenv() {
  jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" $1 > .env
  echo "---> .env created:"
  cat .env
  autoenv_init
}
mergecheck() {
  let current_branch=git rev-parse --abbrev-ref HEAD | tr -d '\n'
  git format-patch $(git merge-base $current_branch $1)..$1 --stdout | git apply --check -
}

mergec() {
  git merge --no-commit branch2
}

# easily create a script and make it executable
#   e.g. touchsh myscript
vimsh() { echo '#!/bin/sh' > $1.sh && chmod +x $1.sh && vim $1.sh; }

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


# draw horizontal line of //
hr() {
  RED='\033[0;31m'
  echo ${RED}
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' ~ # "~" becomes line of //
}


# OSX: open in chrome
chrome() {
  open -a "Google Chrome" --args "$1"
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
