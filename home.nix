{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "frbl";
  home.homeDirectory = "/home/frbl";

  # Packages to install
  home.packages = with pkgs; [
    # Languages
    gcc
    ruby_3_1
    nodejs
    elixir
    erlang
    spotify
    R
    gnumake
    solargraph
    go

    tmuxinator

    tldr # shorter manual pages


    scrot
    imagemagick

    cloc
    ngrok

    vagrant
    virtualbox

    xsel # copy pasting
    yarn

    libreoffice
    xarchiver

    entr

    # Fonts
    fira-code
    nerdfonts

    yamlfix
    yamllint
    yq
    jq
    alacritty
    #docker
    #docker-compose

    kubernetes-helm
    mr
    arandr
    kubectl
    kubeseal
    kube-linter

    _1password

    # slack  # Not installing slack, as it has issues with xdg-open, and I cannot login..
    google-chrome
    htop
    curl
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
    fail2ban
    tmux
    zsh
    #zsh-z 
    #zsh-autosuggestions

    # python packages
    (python310.withPackages (p: with p; [
      regex
      pip
      pyarrow
      jupyter
      pandas
      numpy
      matplotlib
    ]))


    # Editors
    vscode
    neovim

    # i3
    #i3lock
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

  fonts.fontconfig.enable = true;

  # Raw configuration files
  home.file.".config/nvim/init.vim".source = ./config/raw/vimrc;
  home.file.".config/nvim/coc-settings.json".source = ./config/raw/coc-settings.json;
  #home.file.".config/rofi/config.rasi".source = ./config/raw/rofi;
  home.file.".vimrc".source = ./config/raw/vimrc;
  home.file.".tmux.conf".source = ./config/raw/tmux.conf;
  home.file.".agignore".source = ./config/raw/agignore;
  home.file.".compton.conf".source = ./config/raw/compton.conf;
  home.file.".config/i3".source = ./config/raw/i3;
  home.file.".conkyrc".source = ./config/raw/conkyrc;
  home.file.".ctags".source = ./config/raw/ctags;
  home.file.".dmrc".source = ./config/raw/dmrc;
  home.file.".ideavimrc".source = ./config/raw/ideavimrc;
  home.file.".irbrc".source = ./config/raw/irbrc;
  home.file.".mrconfig".source = ./config/raw/mrconfig;
  home.file.".octaverc".source = ./config/raw/octaverc;
  home.file.".Xdefaults".source = ./config/raw/Xdefaults;
  home.file.".Rprofile".source = ./config/raw/Rprofile;
  home.file.".config/xfce4/terminal/terminalrc".source = ./config/raw/xfce_terminal;
  home.file.".snippets/vim/UltiSnips".source = ./config/UltiSnips;
  home.file.".git_template".source = ./config/raw/git_template;
  home.file.".tmuxinator".source = ./config/raw/tmuxinator;
  home.file.".bin".source = ./config/raw/bin;

  imports = [
    ./config/zsh.nix
    ./config/git.nix
    ./config/ssh.nix
    ./config/alacritty.nix
    ./config/direnv.nix
  ];
}
