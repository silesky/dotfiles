#!/bin/bash
#
# Script to toggle hide/unhide hidden files in the Finder application.
#
# Author  : Bert van Langen
# Created : 21 December 2014
#
STATUS=`defaults read com.apple.finder AppleShowAllFiles`
if [ $STATUS == 1 ]
	then
		defaults write com.apple.finder AppleShowAllFiles -boolean false
    echo 'files hid.'
	else
		defaults write com.apple.finder AppleShowAllFiles -boolean true
    echo 'files shown.'
fi

killall Finder && sleep 3 && open /users/ssilesky/
