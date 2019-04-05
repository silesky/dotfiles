#!/bin/sh
tmux split-window -v # split into twp (focus on bottom right)
tmux split-window -h # split the whole thing horizontally (focus still on bottom right)
tmux select-pane -U # select top pane
tmux split-window -h # split top pane (focus on top right)
tmux select-pane -L # move focus to left
clear


