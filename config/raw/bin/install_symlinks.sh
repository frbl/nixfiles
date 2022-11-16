#!/bin/bash
BASE_DIR="$HOME/.cache"
DOTFILE_DIR="$BASE_DIR/dotfiles"

if [ ! -d $DOTFILE_DIR ]; then
  mkdir -p $BASE_DIR
  git clone https://github.com/frbl/dotfiles.git $DOTFILE_DIR
fi

link() {
  source=$1
  target=$2
  use_sudo=$3
  FALSE=false
  FOO=${3:-FALSE}
  if [ -f "$target" -o -d "$target" -o -L "$target" ]
  then
    if [ $use_sudo ]; then
      sudo rm -rf $target
    else
      rm -rf $target
    fi
  fi
  if [ $use_sudo ]; then
    sudo ln -s $source $target
  else
    ln -s $source $target
  fi
}

mkdir -p ~/.config

OIFS="$IFS"
IFS=$'\n'

for file in `find -H "$DOTFILE_DIR" -maxdepth 2 -name '*.symlink'`
do
  echo $file
  target="$HOME/.$(basename "${file%.*}")"
  link $file $target
done

for file in `find -H "$DOTFILE_DIR" -maxdepth 2 -name '*.symlink-nohide'`
do
  target="$HOME/$(basename "${file%.*}")"
  link $file $target
done

# .Config dir
for file in `find -H "$DOTFILE_DIR/config" -maxdepth 1 -mindepth 1`
do
  target="$HOME/.config/$(basename "${file}")"
  link $file $target
done

IFS="$OIFS"

#link $DOTFILE_DIR/Library/Preferences/com.irradiatedsoftware.SizeUp.plist.symlink-nohide $HOME/Library/Preferences/com.irradiatedsoftware.SizeUp.plist

# Other files
link $DOTFILE_DIR/etc/ssh/ssh_config /etc/ssh/ssh_config true
link $DOTFILE_DIR/etc/ssh/sshd_config /etc/ssh/sshd_config true

mkdir -p /usr/local/etc/tor
link $DOTFILE_DIR/usr/local/etc/tor/torrc /usr/local/etc/tor/torrc true

mkdir -p ~/.config/nvim/
link $DOTFILE_DIR/vim/vimrc.symlink ~/.config/nvim/init.vim


if [[ "$OSTYPE" == "linux-gnu" ]]; then
  link /home /Users true
elif [[ "$OSTYPE" == "darwin"* ]]; then
  link /Users /home true
fi

link $DOTFILE_DIR/Wallpapers ~/Wallpapers

# fonts
link $DOTFILE_DIR/fonts ~/.fonts
sudo fc-cache
fc-cache

