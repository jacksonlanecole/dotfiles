#!/bin/sh

export PATH="$PATH:$(du "$HOME/bin/" "$HOME/.local/bin/" | sed '/.git/d' | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export WALLPAPERS="$HOME/media/photos/wallpapers"

localprofile="$HOME/.local-profile"
if [ ! -f "$localprofile" ]; then
    touch "$localprofile"
    printf "#!/bin/sh\n\n" >> "$localprofile"
    printf "# Please populate this file with local settings that should be\n" >> "$localprofile"
    printf "# sourced on login.\n" >> "$localprofile"
fi

. "$localprofile"
