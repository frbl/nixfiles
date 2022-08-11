{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
          primary = {
          foreground = "0xffffff";
        };
      };
      font = {
        size = 7.0;
        normal = {
          family = "monospace";
          #family = "Consolas";
          #family = "Source Code Pro";
        };
      };
    };
  };
}
