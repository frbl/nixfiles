{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "frbl";
  home.homeDirectory = "/home/frbl";

  # Packages to install
  home.packages = [
    pkgs.htop
    pkgs.curl
    pkgs.neovim
    pkgs.xautolock
    pkgs.fzf
    pkgs.htop
    pkgs.patch
    pkgs.git
    pkgs.rofi
    pkgs.silver-searcher
    pkgs.feh
    pkgs.xclip
    pkgs.zathura
    pkgs.ranger
    pkgs.python3
    pkgs.fail2ban
    pkgs.asdf-vm
    pkgs.zsh
    pkgs.tmux
    pkgs.i3lock
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
