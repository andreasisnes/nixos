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
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = "nb_NO.UTF-8";
  };

  imports = [
    ./hardware-configuration.nix

    # Hardware
    # ../../modules/bluetooth.nix

    # Users
    ../../users/server-default.nix

    # System
    ../../modules/nix.nix
    ../../modules/boot.nix
    ../../modules/network.nix
    ../../modules/time.nix
    ../../modules/zsh.nix
    ../../modules/git.nix
    ../../modules/ssh.nix
    ../../modules/home-manager.nix

    # Programming
    ../../modules/direnv.nix
    ../../modules/docker.nix
    ../../modules/dotnet.nix

    # Window manager
    ../../modules/hyprland/hyprland.nix
  ];

  environment.systemPackages = with pkgs; [
    go
  ];

  # Configure console keymap
  console.keyMap = "no";
}
