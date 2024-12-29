{
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = {
      switch = "setxkbmap -option caps:escape";
      update = "home-manager switch --max-jobs 8";
      upgrade = "nix-channel --update --max-jobs 8; home-manager switch --max-jobs 8";
      alacritty = "nixGL alacritty";
      vi = "nvim";
      vim = "nvim";
      pw = "openssl rand -base64 32";
      dus = "du -sh -d1 * | gsort -h";

      i = "mr config ~/.mrconfig co";
      clock = "watch -t -n1 'date'";

      steamlink = "flatpak run com.valvesoftware.SteamLink";

      mux = "tmuxinator";
      tx = "tmuxinator";

      anonymous = "tor &; pid=$!;networksetup -setsocksfirewallproxy Wi-Fi localhost 9050; read; networksetup -setsocksfirewallproxystate Wi-Fi off; kill $pid";

      #edits
      emux = "nvim ~/nixfiles/config/raw/tmuxinator; update";
      enix = "nvim ~/nixfiles/home.nix; update";
      vimrc = "nvim ~/.config/nvim";
      evimrc = "nvim ~/.config/nvim";
      profile = "nvim ~/nixfiles/config/zsh.nix;update";
      eprofile = "nvim ~/nixfiles/config/zsh.nix;update";
      ezsh = "nvim ~/nixfiles/config/zsh.nix;update";


      # Git
      gl = "git track; git pull";
      gv = "vim `git diff --name-only`";
      gcob = "g cob";
      gsi = "git submodule update --init --recursive -j 8";

      # Docker / Kube
      k = "kubectl";
      d = "docker";
      docker-compose = "docker compose";
      dc = "docker compose";
      dcf = "docker compose $(find docker-compose* | sed -e 's/^/ -f /' | tr -d '\n') $1";
      dcbu = "dcf down; dcf build; dcf up;";

      swagger="echo 'Starting swagger on port 8888'; d run -p 8888:8080 swaggerapi/swagger-editor";

      # Ruby
      bi = "bundle install -j 12";
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

      sonar = "docker run -it --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest";
    };


    sessionVariables = {
      # No telemetry on Azure
      FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT = "true";

      # Android installed through apt
      ANDROID_HOME="/usr/lib/android-sdk";

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
      unsetopt share_history

      # Immediate append history
      setopt inc_append_history

      # Add timestamp to hist
      setopt EXTENDED_HISTORY
      export HISTTIMEFORMAT="[%F %T] "

      # Don't ask for confirmation for history commands
      setopt no_hist_verify

      # Dont save duplicates
      setopt hist_ignore_all_dups

      setopt prompt_subst

      # Enable zsh as default
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
    '';

    initExtraFirst = ''
      # Theming section
      autoload -U colors

      # Make sure the prompt subst option is on, so the prompt gets
      # reevaluated.
      setopt prompt_subst
      colors
    '';

    initExtra = ''
      setxkbmap -option altwin:swap_alt_win
      setxkbmap -option caps:swapescape

      # Enable vim mode
      # Note: that destroys ctrl-A
      # bindkey -v
      bindkey -e

      pronkridderscreensix() {
        xrandr --newmode "5120x1440R"  469.00  5120 5168 5200 5280  1440 1443 1453 1481 +hsync -vsync
        xrandr --addmode DP-1 "5120x1440R"
        xrandr --output DP-1 --auto
        xrandr --output DP-1 --mode "5120x1440R"
      }
      
      hnkscreen() {
        xrandr --newmode "hnk"  533.87  3440 3712 4088 4736  1440 1441 1444 1503  -HSync +Vsync
        xrandr --addmode HDMI-1 "hnk"
        xrandr --output HDMI-1 --mode "hnk"
      }

      ksh() {
        echo Namepace $1
        echo Application $2
        pod=`kubectl get pods -n $1 -l app=$2 --field-selector=status.phase=Running --no-headers | grep Running | awk '{print $1}' | head -n1`
        echo Pod $pod
        kubectl exec -it -n $1 $pod -- /bin/sh
      }

      krs() {
        echo Namepace $1
        echo Application $2
        kubectl rollout restart deployment $2 -n $1
      }

      klog() {
        echo Namepace $1
        echo Application $2
        kubectl logs -f -l app=$2 -n $1
      }

      kreapply() {
        kubectl delete -f $*
        kubectl apply -f $*
      }

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

      
      pronkridder-screen() {
        xrandr --output DP-1 --off
        xrandr --output DP-1 --mode "5120x1440" 
        xrandr --output DP-1 --auto
        xrandr --output DP-1 --right-of eDP-1
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

      source <(kubectl completion zsh)

      chmod 700 ~/.ssh
      [ -e $HOME/.ssh/id_rsa ] && chmod 600 ~/.ssh/id_rsa

      # git theming default: Variables for theming the git info prompt
      export BROWSER="google-chrome-stable";
      export PROMPT="$FG[008]%T%{$reset_color%} %n@%M:%~ $FG[032]%#%{$reset_color%} %{$reset_color%}";

      export ZSH_THEME_GIT_PROMPT_PREFIX="(%{$reset_color%}"         # Prefix at the very beginning of the prompt, before the branch name
      export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"             # At the very end of the prompt
      export ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%} $GIT_PROMPT_SYMBOL"              # Text to display if the branch is dirty
      export ZSH_THEME_GIT_PROMPT_CLEAN=""               # Text to display if the branch is clean

      # Note that this propmpt requires single quotes, otherwise it will be evaluated immediately.
      export RPROMPT='%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}';

      export NIXPKGS_ALLOW_UNFREE=1

      export PATH=$PATH:~/.bin
    '';

    history = {
      size = 10000000;
      path = "$HOME/.zshhist";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" "fzf" "colored-man-pages" "asdf" ];
    };
  };
}
