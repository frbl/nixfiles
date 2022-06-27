{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      vi = "nvim";
      ll = "ls -l";
      update = "home-manager switch";
    };


    localVariables = {
      COLORTERM = "truecolor";
      TERM = "xterm-256color";
      EDITOR = "nvim";
      LC_ALL = "en_US.utf-8";
      LANG = "$LC_ALL";
      LSCOLORS="dxfxcxdxbxegedabagacad";
      PROMPT="$FG[008]%T%{$reset_color%} %n@%M:%~ $FG[032]%#%{$reset_color%} %{$reset_color%}";
      #RPROMPT="%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}";
    };

    profileExtra = ''
      # Don't share history between sessions
      unsetopt inc_append_history
      unsetopt share_history

      # Don't ask for confirmation for history commands
      setopt no_hist_verify

      setopt prompt_subst

      # Enable zsh as default
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
    '';

    initExtra = ''
      setxkbmap -option altwin:swap_alt_win
      setxkbmap -option caps:swapescape

      # Theming section
      autoload -U colors
      colors
    '';

    history = {
      size = 10000;
      path = ".zshhist";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" "fzf" "colored-man-pages" "asdf" ];
    };
  };
}
