{ pkgs, ... }: {
  
  host = {
    # Locals
    hostname = "isnes";
    username = "andreas";

    gitUsername = "Andreas Isnes";
    gitEmail = "andreas.isnes@gmail.com"
  }

  imports = [

  ]

  environment.systemPackages = with pkgs; [
    # Dev Tools
    go

    nixfmt
  ];

  networking.hostName = "andreas-development";
}
