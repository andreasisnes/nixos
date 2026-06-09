{ pkgs, ... }: {
  host = {
    hostname     = "andreas-server";
    username     = "andreas";
    flakePath = "/home/andreas/Projects/github.com/andreasisnes/nixos";
    stateVersion = "25.11";

    gitUsername = "Andreas Isnes";
    gitEmail = "andreas.isnes@gmail.com";

    # Devices for some features
    keyboardLightID = "tpacpi::kbd_backlight"; # From brightnessctl -l
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
    ../../modules/bluetooth.nix

    # Users
    ../../users/laptop.nix

    # System
    ../../modules/boot.nix
    ../../modules/login-manager.nix

    ../../modules/home-manager.nix
    ../../modules/nix.nix


    # System Configuration
    ../../modules/ghostty.nix
    ../../modules/zsh.nix
    ../../modules/git.nix
    ../../modules/ssh.nix
    ../../modules/fonts.nix
    ../../modules/network.nix
    ../../modules/media.nix
    ../../modules/time.nix
    ../../modules/file-manager.nix
    ../../modules/zoxide.nix

    # GUI configuration
    ../../modules/xdg.nix
    ../../modules/qt.nix
    ../../modules/gtk.nix

    # Programming
    ../../modules/vscode/vscode.nix
    ../../modules/ai-agent.nix
    ../../modules/direnv.nix
    ../../modules/docker.nix
    ../../modules/dotnet.nix

    # Windows Managers
    ../../modules/hyprland/hyprland.nix
    ../../modules/noctalia/noctalia.nix
    ../../modules/vicinae.nix

    # Apps
    ../../modules/brave.nix
    ../../modules/desktop/apps.nix
  ];

  environment.systemPackages = with pkgs; [
    go
    fastfetch
  ];

  # Configure console keymap
  console.keyMap = "no";
}
