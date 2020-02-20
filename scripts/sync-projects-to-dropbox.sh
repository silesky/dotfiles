#!/usr/bin/env bash
CODE_ROOT=~/Dropbox/_code/
PROJECT_ROOT=~/projects/lm-core
EXCLUDE_PATH=~/scripts/sync-projects-to-dropbox.exclude.txt

rsync -avzh --exclude-from "$EXCLUDE_PATH" $PROJECT_ROOT $CODE_ROOT
