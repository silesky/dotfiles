#!/bin/sh
if pgrep -x "mongod" > /dev/null
   then echo "mongod already running"
   else sudo mongod
fi
