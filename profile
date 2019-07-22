#!/bin/sh

export PATH="$PATH:$(du "$HOME/bin/" "$HOME/.local/bin/" | sed '/.git/d' | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "/opt" 2>/dev/null | grep "Qt" | grep "/bin$" |sed '/.git/d' | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export WALLPAPERS="$HOME/media/photos/wallpapers"
