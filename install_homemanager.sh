#!/bin/bash
# Install nix
sudo apt-get install -y curl
curl -L https://nixos.org/nix/install | sh

. $HOME/.nix-profile/etc/profile.d/nix.sh

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# Install homemanager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Fix opengl on nix
nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault
sudo apt-get install i3
sudo apt-get remove --purge -y curl
sudo apt-get -y autoremove

rm -rf ~/.config/nixpkgs
ln -s ~/nixfiles ~/.config/nixpkgs
 
home-manager build
home-manager switch -b backup

# In case you get issues with conflicting versions, you can change the priority of the nix version
# nix-env --set-flag priority 0 nix-2.11.1
