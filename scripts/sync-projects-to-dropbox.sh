#!/usr/bin/env bash
CODE_ROOT=~/Dropbox/_code/
PROJECT_ROOT=~/projects/
EXCLUDE_PATH=~/scripts/sync-projects-to-dropbox.exclude.txt
rsync -avzh --exclude-from "$EXCLUDE_PATH" $PROJECT_ROOT $CODE_ROOT

# EDITOR=vim crontab -e
## sync every 15 minutes
# 0/15 * * * * sh ~/scripts/sync-projects-to-dropbox.sh
