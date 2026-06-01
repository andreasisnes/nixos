{ host, inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users.${host.username} = {
    isNormalUser = true;
    home = "/home/${host.username}";
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${host.username} = {
      home = {
        username = "${host.username}";
        homeDirectory = "/home/${host.username}";
        stateVersion = "${host.stateVersion}";
      };
    };
  };
}