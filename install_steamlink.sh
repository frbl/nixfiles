#!/bin/sh
sudo apt update
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.valvesoftware.SteamLink

flatpak run com.valvesoftware.SteamLink
