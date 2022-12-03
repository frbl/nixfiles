#!/bin/sh

# Add the shell as a valid option
shell="/home/frbl/.nix-profile/bin/zsh"
file="/etc/shells"
grep -qxF "$shell" $file || echo $shell | sudo tee -a /etc/shells
chsh -s $shell

# Setup private key
mkdir -p ~/.ssh
op document get "SSH private key" > ~/.ssh/id_rsa
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
