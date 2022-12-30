#!/bin/sh

# Add the shell as a valid option
shell="/home/frbl/.nix-profile/bin/zsh"
file="/etc/shells"
grep -qxF "$shell" $file || echo $shell | sudo tee -a /etc/shells
chsh -s $shell

#account add --shorthand abl --address my.1password.com --email f.j.blaauw@researchable.nl
#account add --shorthand my --address my.1password.com --email frank.blaauw@gmail.com

# Setup private key
mkdir -p ~/.ssh
op document get "SSH private key" --account my > ~/.ssh/id_rsa
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa

# Setup GPG
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
op document get "GPG f.j.blaauw@researchable.nl - private" --account abl > /tmp/researchable.key
gpg --import /tmp/researchable.key
rm /tmp/researchable.key


op document get "~/.researchable.yml" --account abl > ~/.researchable.yml
