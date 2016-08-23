#!/bin/sh
tmux split-window -v # split into two (focus on bottom right)
tmux split-window -h # split the whole thing horizontally (focus still on bottom right)
tmux select-pane -t :.+ # select top pane

