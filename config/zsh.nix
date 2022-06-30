{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      update = "home-manager switch";
      alacritty = "nixGL alacritty";
      vi = "nvim";
      vim = "nvim";
      vimrc = "nvim ~/nixfiles/config/raw/vimrc;update";
      profile = "nvim ~/nixfiles/config/zsh.nix;update";
      pw = "openssl rand -base64 32";
      dus = "du -sh -d1 * | gsort -h";

      i = "mr config ~/.mrconfig co";
      clock = "watch -t -n1 'date'";

      anonymous = "tor &; pid=$!;networksetup -setsocksfirewallproxy Wi-Fi localhost 9050; read; networksetup -setsocksfirewallproxystate Wi-Fi off; kill $pid";

      # Git
      gl = "git track; git pull";
      gv = "vim `git diff --name-only`";
      gcob = "g cob";

      # Docker / Kube
      k = "kubectl";
      d = "docker";
      dc = "docker-compose";
      dcf = "docker-compose $(find docker-compose* | sed -e 's/^/ -f /' | tr -d '\n') $1";
      dcbu = "dcf down; dcf build; dcf up;";

      swagger="echo 'Starting swagger on port 8888'; d run -p 8888:8080 swaggerapi/swagger-editor";

      # Ruby
      be = "bundle exec";
      bu = "bundle update";
      bec = "bundle exec rails c";
      bes = "bundle exec rails s";
      ber = "bundle exec rspec";
      
      # Keyboard
      us = "setxkbmap us";
      usi = "setxkbmap us -variant intl";
      swap = "setxkbmap -option caps:swapescape";

      resource = "source ~/.zshrc";
      ":q" = "exit";

      ll = "ls -l";
    };


    sessionVariables = {
      COLORTERM = "truecolor";
      TERM = "xterm-256color";
      EDITOR = "nvim";
      LC_ALL = "en_US.utf-8";
      LANG = "$LC_ALL";
      LSCOLORS="dxfxcxdxbxegedabagacad";
      GIT_PROMPT_SYMBOL="*";


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

    initExtraFirst = ''
      # Theming section
      autoload -U colors
      colors
    '';

    initExtra = ''
      setxkbmap -option altwin:swap_alt_win
      setxkbmap -option caps:swapescape

      # SSH Agent manager
      SSH_ENV="$HOME/.ssh/environment"
      function start_agent {
          # Note: The  SSH_ENV (instead of {SSH_ENV}) is to make this work in
          # home-manager.
          /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
          chmod 600 "$SSH_ENV"
          . "$SSH_ENV" > /dev/null
          /usr/bin/ssh-add;
      }

      # Source SSH settings, if applicable
      if [ -f "$SSH_ENV" ]; then
          . "$SSH_ENV" > /dev/null
          ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ > /dev/null || {
              start_agent;
          }
      else
          start_agent;
      fi

      # git theming default: Variables for theming the git info prompt
      export PROMPT="$FG[008]%T%{$reset_color%} %n@%M:%~ $FG[032]%#%{$reset_color%} %{$reset_color%}";
      export RPROMPT="%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}";

      export ZSH_THEME_GIT_PROMPT_PREFIX="(%{$reset_color%}"         # Prefix at the very beginning of the prompt, before the branch name
      export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"             # At the very end of the prompt
      export ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%} $GIT_PROMPT_SYMBOL"              # Text to display if the branch is dirty
      export ZSH_THEME_GIT_PROMPT_CLEAN=""               # Text to display if the branch is clean
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
