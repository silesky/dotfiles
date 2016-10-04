#!/bin/bash

set -e

# SETTINGS
# ========
# Location of your Dropbox folder
dropbox_folder="/Users/YOUR_NAME/Dropbox"
# Location of dropbox.py (http://www.dropboxwiki.com/tips-and-tricks/using-the-official-dropbox-command-line-interface-cli)
dropbox_script="~/bin/dropbox.py"
# Array of folders to ignore
ignore_list=['bower_components','node_modules','vendor']

# FUNCTIONS
# =========
function dropbox_install(){
    while true; do
        read -p $'\nDo you want to use download and install dropbox.py? (y/n) ' yn
        case $yn in
            [Yy]* )
                dropbox_script_parent=$(dirname $dropbox_script)
                mkdir -p $dropbox_script_parent
                wget -O $dropbox_script "https://www.dropbox.com/download?dl=packages/dropbox.py"
                chmod +x $dropbox_script
                recurse $dropbox
                break;;
            [Nn]* )
                echo 'Aborted. See http://www.dropboxwiki.com/tips-and-tricks/using-the-official-dropbox-command-line-interface-cli#Installation for manual instructions.';
                exit 1;;
        esac
    done
}

function recurse() {
 for i in "$1"/*;do
    if [ -d "$i" ];then
        j=$(basename "$i")
        if [[ " ${ignore_list[*]} " == *$j* ]]; then
            $dropbox_script exclude "$i"
        fi
        recurse "$i"
    fi
 done
}

# SCRIPT
# ======
# Check Dropbox folder location
if [ -d "$dropbox_folder" ];then
    echo "Dropbox found at $dropbox_folder"
else
    echo "Dropbox not found"
    exit 1
fi

# Check for dropbox.py
if [ -e "$dropbox_script" ];then
    recurse $dropbox
else
    dropbox_install
fi
 @AdsonCicilioti
