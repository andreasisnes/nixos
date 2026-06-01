{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/nix
  ];

  networking.hostName = "andreas-server";
}
