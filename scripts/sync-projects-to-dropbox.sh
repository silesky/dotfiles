#!/usr/bin/env bash
CODE_ROOT=/Users/seth.silesky/Dropbox/_code/
PROJECT_ROOT=/Users/seth.silesky/projects/lm-core
EXCLUDE_PATH=~/scripts/sync-projects-to-dropbox.exclude.txt
rsync -avzh --exclude-from "$EXCLUDE_PATH" $PROJECT_ROOT $CODE_ROOT
