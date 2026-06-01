{ pkgs, ... }: {
  
  host = {
    # Localshostname = "isnes";
    username = "andreas";

    gitUsername = "Andreas Isnes";
    gitEmail = "andreas.isnes@gmail.com";

    # Time and Locale settings
    timeZone = "Europe/Oslo";
    console.keyMap = "no";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "nb_NO.UTF-8";
      LC_IDENTIFICATION = "nb_NO.UTF-8";
      LC_MEASUREMENT = "nb_NO.UTF-8";
      LC_MONETARY = "nb_NO.UTF-8";
      LC_NAME = "nb_NO.UTF-8";
      LC_NUMERIC = "nb_NO.UTF-8";
      LC_PAPER = "nb_NO.UTF-8";
      LC_TELEPHONE = "nb_NO.UTF-8";
      LC_TIME = "nb_NO.UTF-8";
    };
  }

  nixpkgs.config.allowUnfree = true;


  imports = [
    ./hardware.nix

    # Users

    # Hardware
    ../../modules/bluetooth.nix

    # System
    ../../modules/nix.nix
    ../../modules/zsh.nix
    ../../modules/git.nix
    ../../modules/ssh.nix
    ../../modules/home-manager.nix

    # Programming Languages
    ../../modules/direnv.nix
    ../../modules/docker.nix
    ../../modules/dotnet.nix
  ]

  system.stateVersion = "25.11"; # Did you read the comment?
}
