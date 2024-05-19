{ config, pkgs, ... }:

{

  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };


  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "frbl";
  home.homeDirectory = "/home/frbl";

  # Packages to install
  home.packages = with pkgs; [
    # Languages
    terraform
    gcc
    ruby_3_1
    nodejs
    elixir
    erlang
    R
    rstudio
    gnumake
    solargraph
    go
    android-tools

    # Games
    gcompris

    gpredict

    swagger-codegen

    logseq
    picom

    texlive.combined.scheme-full

    obsidian

    teleport
    doctl

    sonar-scanner-cli

    # Amateur radio
    chirp
    gqrx
    sdrangel
    cubicsdr
    wsjtx
    fldigi
    qsstv
    gpredict

    # RTL-SDR drivers
    libusb1
    rtl-sdr-osmocom

    #nixFlakes

    # General
    openssl
    pandoc

    # npm
    nodePackages.http-server
    nodePackages.serverless
    nodePackages.eas-cli
    nodePackages.expo-cli
    cypress

    tree
    tree-sitter

    # Applications
    gimp
    grafana

    # Emulation
    flatpak
    bottles

    spotify

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

    #yamlfix
    yamllint
    yq
    jq
    alacritty
    #docker
    #docker-compose

    minikube
    k9s
    kubernetes-helm
    kubectl
    kubeseal
    kube-linter
    argocd
    trivy # Vulnerability scanner for containers

    # Cloud env
    azure-cli
    azure-functions-core-tools

    mr
    arandr

    _1password

    # Slack might give issues with XDG open. On the latest ubuntu I did not
    # have any issues, hence its back in the list.
    slack 
    google-chrome
    #curl
    xautolock
    fzf
    htop
    geekbench
    cpupower-gui
    conky
    btop
    patch
    git
    rofi

    # Searching
    silver-searcher
    ripgrep  # Also used by telescope nvim
    fd # Also used by telescope nvim

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
      #jupyter
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
  #home.file.".config/nvim/init.vim".source = ./config/raw/vimrc;
  #home.file.".config/nvim/coc-settings.json".source = ./config/raw/coc-settings.json;

  #home.file.".vimrc".source = ./config/raw/vimrc;
  #home.file.".config/nvim".source = ./config/raw/nvim;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./config/raw/nvim;

  home.file.".tmux.conf".source = ./config/raw/tmux.conf;
  home.file.".config/nix/nix.conf".source = ./config/raw/nix.conf;
  home.file.".agignore".source = ./config/raw/agignore;
  home.file.".compton.conf".source = ./config/raw/compton.conf;
  home.file.".config/i3".source = ./config/raw/i3;
  home.file.".config/rofi".source = ./config/raw/rofi;
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
  home.file.".config/zathura/zathurarc".source = ./config/raw/zathurarc;
  home.file.".snippets/vim/UltiSnips".source = ./config/UltiSnips;
  home.file.".git_template".source = ./config/raw/git_template;
  home.file.".tmuxinator".source = ./config/raw/tmuxinator;
  home.file.".bin".source = ./config/raw/bin;
  home.file."Wallpapers".source = ./config/raw/wallpapers;

  imports = [
    ./config/zsh.nix
    ./config/git.nix
    ./config/ssh.nix
    ./config/alacritty.nix
    ./config/direnv.nix
  ];
}
