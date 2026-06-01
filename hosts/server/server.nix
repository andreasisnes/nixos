{ pkgs, ... }: {
  
  host = {
    hostname     = "andreas-server";
    username     = "andreas";
    flakePath = "/home/andreas/config";
    stateVersion = "25.11";

    gitUsername = "Andreas Isnes";
    gitEmail = "andreas.isnes@gmail.com";

    # Time and Locale settings
    timeZone = "Europe/Oslo";
    console.keyMap = "no";
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = "nb_NO.UTF-8";
  };

  imports = [
    ./hardware-configuration.nix

    # Hardware
    ../../modules/bluetooth.nix

    # System
    ../../modules/nix.nix
    ../../modules/zsh.nix
    ../../modules/git.nix
    ../../modules/ssh.nix
    ../../modules/time.nix
    ../../modules/home-manager.nix

    # Programming Languages
    ../../modules/direnv.nix
    ../../modules/docker.nix
    ../../modules/dotnet.nix
  ];

  environment.systemPackages = with pkgs; [
    go
  ];
}
