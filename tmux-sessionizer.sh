#!/usr/bin/env bash

session=$(find ~ ~/github/ ~/secrets/ -mindepth 1 -maxdepth 1 -type d | grep -v -e "\." | fzf)
session_name=$(basename "$session")

if ! tmux has-session -t "$session_name" 2> /dev/null; then
	tmux new-session -s "$session_name" -c "$session" -d
fi

tmux switch-client -t "$session_name"
