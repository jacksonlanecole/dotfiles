#!/bin/sh

export dotfiles_dir
dotfiles_dir=$(dirname $(readlink -f $0))

git --work-tree="$dotfiles_dir" --git-dir="$dotfiles_dir/.git" pull origin master

ln -svf "$dotfiles_dir/tmux.conf" $HOME/.tmux.conf
ln -svf "$dotfiles_dir/vimrc/vimrc-minimal" $HOME/.vimrc
ln -svf "$dotfiles_dir/inputrc" $HOME/.inputrc
ln -svf "$dotfiles_dir/bashrc" $HOME/.bashrc
ln -svf "$dotfiles_dir/profile" $HOME/.profile
