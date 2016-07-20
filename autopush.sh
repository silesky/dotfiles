#!/bin/bash

# don't need semicolons bc the newline is also a command seperator

source '/Users/ssilesky/.bash_profile'
cd '/Users/ssilesky/projects/practicetimer' && git push
cd '/Users/ssilesky' && /usr/local/Cellar/git/2.8.4/bin/git add . && /usr/local/Cellar/git/2.8.4/bin/git commit -m 'autopush' && git push
cd '/Users/ssilesky/Library/Application Support/Sublime Text 3/Packages/User/' && gist -u 8d3b87b2aac5cc0b3805738540320dcd *.sublime-settings
