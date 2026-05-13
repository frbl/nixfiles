#!/bin/sh
#home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./config/raw/nvim;

ln -s ~/nixfiles/config/raw/tmux.conf ~/.tmux.conf
ln -s ~/nixfiles/config/raw/agignore ~/.agignore
ln -s ~/nixfiles/config/raw/ctags ~/.ctags
ln -s ~/nixfiles/config/raw/dmrc ~/.dmrc
ln -s ~/nixfiles/config/raw/ideavimrc ~/.ideavimrc
ln -s ~/nixfiles/config/raw/irbrc ~/.irbrc
ln -s ~/nixfiles/config/raw/mrconfig ~/.mrconfig
ln -s ~/nixfiles/config/raw/octaverc ~/.octaverc
ln -s ~/nixfiles/config/raw/Xdefaults ~/.Xdefaults
ln -s ~/nixfiles/config/raw/Rprofile ~/.Rprofile

mkdir -p ~/.config/zathura
ln -s ~/nixfiles/config/raw/zathurarc ~/.config/zathura/zathurarc

mkdir -p ~/.config/kmonad
ln -s ~/nixfiles/config/raw/kmonad ~/.config/kmonad/keyboard.kbd

mkdir -p ~/.config/espanso/match
ln -s ~/nixfiles/config/raw/espanso.yml ~/.config/espanso/match/base.yml

mkdir -p ~/.snippets/vim
ln -s ~/nixfiles/config/UltiSnips ~/.snippets/vim/UltiSnips
ln -s ~/nixfiles/config/raw/git_template ~/.git_template
ln -s ~/nixfiles/config/raw/tmuxinator ~/.tmuxinator
ln -s ~/nixfiles/config/raw/bin ~/.bin
