{
  # See https://github.com/nix-community/nix-direnv
  # for instructions. A simple example:
  # default.nix:
  # ```
  # { pkgs ? import <nixpkgs> {}}:
  # pkgs.mkShell {
  #   nativeBuildInputs = [ pkgs.hello ];
  # }
  # ```
  # and run `echo "use nix" >> .envrc`
  # and run `direnv allow`
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };
}
