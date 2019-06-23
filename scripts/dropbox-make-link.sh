#!/bin/bash env
DIR_NAME=$1
DIR_PATH=$(pwd $DIR_NAME)
[ -z $DIR_NAME ] && echo "please pass a project folder" && exit 1
rm -rf $DIR_NAME/node_modules
cd ~/projects && ln -s $DIR_PATH ~/Dropbox/_code/$DIR_NAME && echo "'$1' moved." && cd - || return
