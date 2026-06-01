{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      development = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/development
          home-manager.nixosModules.home-manager
          { home-manager.useGlobalPkgs = true; home-manager.useUserPackages = true; }
        ];
      };

      personal = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/personal
          home-manager.nixosModules.home-manager
          { home-manager.useGlobalPkgs = true; home-manager.useUserPackages = true; }
        ];
      };

      server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/server
        ];
      };
    };
  };
}
