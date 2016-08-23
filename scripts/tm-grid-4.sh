#!/bin/sh
tmux new-session -d -s foo
tmux rename-window 'Foo'
tmux select-window -t foo:0
tmux split-window -h
tmux split-window -v -t 0
tmux split-window -v -t 1
tmux -2 attach-session -t foo
