#!/bin/bash
# In case something goes wrong: Problems with 'no space left on device' This has to do with tmpfs / systemd. Edit /etc/systemd/logind.conf and change the percentage from 10% to something like 50%. Reboot and the issues should be fixed.
# Install nix
sudo apt-get update
sudo apt-get install -y curl
curl -L https://nixos.org/nix/install | sh

. $HOME/.nix-profile/etc/profile.d/nix.sh

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# Install homemanager
export NIXPKGS_ALLOW_UNFREE=1
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Fix opengl on nix
nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault
sudo apt-get install -y i3
sudo apt-get remove --purge -y curl
sudo apt-get -y autoremove

rm -rf ~/.config/nixpkgs
ln -s ~/nixfiles ~/.config/home-manager
 
home-manager build
home-manager switch -b backup

# In case you get issues with conflicting versions, you can change the priority of the nix version
# nix-env --set-flag priority 0 nix-2.11.1

# Set up NVIM packer
rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Setup ZSH as default shell
sudo grep -qxF $(which zsh) /etc/shells \
  || echo $(which zsh) | sudo tee -a /etc/shells

cat /etc/shells

chsh -s $(which zsh)
