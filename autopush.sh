#!/bin/bash
source '/Users/ssilesky/.bash_profile'
cd '/Users/ssilesky/projects/practicetimer' && git push 
cd '/Users/ssilesky' && git add . && git commit -m 'autopush' && git push
cd '/Users/ssilesky/Library/Application Support/Sublime Text 3/Packages/User/' && gist -u 8d3b87b2aac5cc0b3805738540320dcd *.sublime-settings
