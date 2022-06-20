{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "frbl";
  home.homeDirectory = "/home/frbl";

  # Packages to install
  home.packages = with pkgs; [
    gcc
    google-chrome
    zsh-z
    htop
    curl
    neovim
    xautolock
    fzf
    htop
    patch
    git
    rofi
    silver-searcher
    feh
    xclip
    zathura
    ranger
    python3
    fail2ban
    asdf-vm
    zsh
    tmux
    vscode
    i3lock
    i3-gaps
    i3status
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

  # Raw configuration files
  home.file.".config/nvim/init.vim".source = ./config/raw/vimrc;
  home.file.".tmux.conf".source = ./config/raw/tmux.conf;

  imports = [
    ./config/git.nix
  ];
}
