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
        size = 8.0;
        normal = {
          family = "monospace";
          #family = "Fira Code";
          #family = "DejaVu Sans Mono Nerd Font";
          style = "Retina";
          #family = "Source Code Pro";
        };
      };
    };
  };
}
