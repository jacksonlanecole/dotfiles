#!/bin/sh

export PATH="$PATH:$(du "$HOME/bin/" "$HOME/.local/bin/" | sed '/.git/d' | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="ranger"
export WALLPAPERS="$HOME/media/photos/wallpapers"
