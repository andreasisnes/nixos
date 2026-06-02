{ pkgs, ... }: {
  host = {
    hostname     = "andreas-server";
    username     = "andreas";
    flakePath = "/home/andreas/Projects/github.com/andreasisnes/nixos";
    stateVersion = "25.11";

    gitUsername = "Andreas Isnes";
    gitEmail = "andreas.isnes@gmail.com";

    # Devices for some features
    touchpadID = "asue120b:00-04f3:31c0-touchpad"; # From hyprctl devices
    keyboardLightID = "asus::kbd_backlight"; # From brightnessctl -l
    keyboardScreenOFFLightID = "asus::camera"; # From brightnessctl -l shines when screen and keyboard are off
    languageLightID = "platform::micmute"; # Same used to indicate not en lang
    keyboardLayout = "no";

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
    ../../modules/login-manager.nix
    ../../modules/zsh.nix
    ../../modules/git.nix
    ../../modules/ssh.nix
    ../../modules/fonts.nix
    ../../modules/home-manager.nix
    ../../modules/ghostty.nix

    # Programming
    ../../modules/vscode/vscode.nix
    ../../modules/direnv.nix
    ../../modules/docker.nix
    ../../modules/dotnet.nix

    # Window manager
    ../../modules/hyprland/hyprland.nix
    ../../modules/noctalia/noctalia.nix
    ../../modules/vicinae.nix
    
    # Apps
    ../../modules/brave.nix
  ];

  environment.systemPackages = with pkgs; [
    go
  ];

  # Configure console keymap
  console.keyMap = "no";
}
