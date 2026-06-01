{ pkgs, ... }: {
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

    # Users
    ./../../modules/users/server-default.nix

    # System
    ../../modules/nix.nix
    ../../modules/zsh.nix
    ../../modules/git.nix
    ../../modules/ssh.nix
    ../../modules/time.nix
    ../../modules/home-manager.nix
    ../../modules/networking.nix

    # Programming
    ../../modules/direnv.nix
    ../../modules/docker.nix
    ../../modules/dotnet.nix

    # Networking
  ];

  environment.systemPackages = with pkgs; [
    go
  ];
}
