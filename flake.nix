{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

outputs = inputs: {
    nixosConfigurations = inputs.nixpkgs.lib.genAttrs (builtins.attrNames (builtins.readDir ./hosts)) (
      host:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./lib/lib.nix
          ./hosts/${host}/${host}.nix
        ];
      }
    );
  };
}
