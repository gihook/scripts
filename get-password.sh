#!/bin/sh

source ~/secrets/environment-variables

file_path=$(echo $MY_PWD_FILE_LOCATION)

selected=$(echo $MY_KEEPASS | keepassxc-cli ls $file_path | fzf)

echo $MY_KEEPASS | keepassxc-cli clip $file_path "$selected"
