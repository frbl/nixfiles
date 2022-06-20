{
  programs.git = {
    enable = true;
    userEmail = "f.j.blaauw@researchable.nl";
    userName = "Frank Blaauw";
    signing = {
      signByDefault = false;
      key = "433A4D006D0344B08D6502FD7013901F19B263CF";
    };
    aliases = {
      track = "!git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`";
      co = "checkout";
      cob = "checkout -b";
      ci = "commit";
      st = "status";
      br = "branch";
      hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
      l = "log --pretty=frank --graph --date=short";
      type = "cat-file -t";
      dump = "cat-file -p";
      undo = "reset --soft HEAD~1";
      brd = "!git branch --merged | grep -v -E '\\*|master|production' | xargs -n 1 git branch -d; git fetch --prune --all";
      d = "difftool";
#      accept-ours = "!f() { git checkout --ours -- \"${@:-.}\"; git add -u \"${@:-.}\"; }; f";
#      accept-theirs = "!f() { git checkout --theirs -- \"${@:-.}\"; git add -u \"${@:-.}\"; }; f";
      ignore = "!git rm -r --cached .; git commit -a";
    };
    extraConfig = {
      core = {
        editor = "nvim";
        #excludesfile = "/home/frbl/.gitignore_global";
      };
      push = { 
        default = "current"; 
      };
      merge = {
        keepBackup = false;
        conflictstyle = "diff3";
        tool = "nvimdiff";
      };
      init = {
        templatedir = "~/.git_template";
      };
      github = { 
        user = "frbl"; 
      };
      color = {
        branch = "auto";
        diff = "auto";
        status = "auto";
      };
      "diff" = { tool = "nvimdiff"; };
      "difftool" = { prompt = true; };
      "difftool \"nvimdiff\"" = { cmd = ''nvim -d "$LOCAL" "$REMOTE"''; };
      "mergetool" = { prompt = true; };
      "mergetool \"nvimdiff\"" = { cmd = ''nvim -d "$LOCAL" "$REMOTE"''; };
    };
  };
}
