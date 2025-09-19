{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "bandit0" = {
        host = "bandit0";
        hostname = "bandit.labs.overthewire.org";
        user = "bandit0";
        port = 2220;
        serverAliveInterval = 10;
      };
      "home" = {
        host = "home";
        hostname = "86.89.168.179";
        user = "frbl";
        serverAliveInterval = 10;
        port = 1406;
        localForwards = [
          {
            bind.port = 9001;
            host.address = "127.0.0.1";
            host.port = 9001;
          }
          {
            bind.port = 9902;
            host.address = "127.0.0.1";
            host.port = 9901;
          }
          {
            bind.port = 3000;
            host.address = "127.0.0.1";
            host.port = 3000;
          }
          {
            bind.port = 3002;
            host.address = "127.0.0.1";
            host.port = 3002;
          }
          {
            bind.port = 8000;
            host.address = "127.0.0.1";
            host.port = 8000;
          }
          {
            bind.port = 8080;
            host.address = "127.0.0.1";
            host.port = 8080;
          }
        ];
      };
    };
  };
}
