#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

ln -svf "$DOTFILES_DIR/tmux.conf" $HOME/.tmux.conf
ln -svf "$DOTFILES_DIR/vimrc/vimrc-minimal" $HOME/.vimrc

if [[ "$OSTYPE" == "darwin"* ]]; then
	ln -svf "$DOTFILES_DIR/chunkwmrc" $HOME/.chunkwmrc
	ln -svf "$DOTFILES_DIR/skhdrc" $HOME/.skhdrc
fi
