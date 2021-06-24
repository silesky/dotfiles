#!/bin/bash
# EDITOR=vim crontab -e
# 0/15 * * * * sh ~/scripts/autopush.sh
cd ~ && /usr/bin/git add . && /usr/bin/git commit -m 'autopush' && git push
