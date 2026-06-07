{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "home" = {
        host = "home";
        hostname = "86.89.168.179";
        user = "frbl";
        serverAliveInterval = 10;
        port = 1406;
        localForwards = [
        ];
      };
    };
  };
}
