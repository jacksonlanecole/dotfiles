#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -x 'git -a -d "$DOTFILES_DIR/.git"' ]]
  then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
fi

ln -svf "$DOTFILES_DIR/tmux.conf" $HOME/.tmux.conf
ln -svf "$DOTFILES_DIR/vimrc/vimrc-noplugins" $HOME/.vimrc
