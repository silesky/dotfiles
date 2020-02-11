#!/bin/sh

if [ "$#" -gt 1 ]; then
    /bin/sh "$@"
else
    #
    SESSION="vscode`pwd | md5`"
    tmux attach -d -t $SESSION || tmux new-session -s $SESSION
fi
