# for osx mojave
tell application "System Preferences"
	activate
	set the current pane to pane id "com.apple.preference.universalaccess"
	delay 1 # needs time to open universal access
	tell application "System Events" to tell process "System Preferences" to tell window "Accessibility"
		tell scroll area 1 to tell table 1 to tell row 6 #open display preferences
			select
		end tell
		tell group 1
			click checkbox "Use grayscale"
		end tell
	end tell
end tell

tell application "System Preferences" to quit