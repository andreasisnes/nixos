{ host, ... }:
{
  users.mutableUsers = true;
  users.users.${host.username} = {
    isNormalUser = true;
    description = "${host.gitUsername}";
    extraGroups = [
      "wheel"
    ];
    ignoreShellProgramCheck = true;
  };
  nix.settings.allowed-users = [ "${host.username}" ];
  users.groups.media = {};
  users.users.qbittorrent.extraGroups = [ "media" ];
  users.users.jellyfin.extraGroups = [ "media" ];
  users.users.sonarr.extraGroups = [ "media" ];
  users.users.radarr.extraGroups = [ "media" ];

  networking.firewall.allowedTCPPorts = [
    8096  # jellyfin
    8989  # sonarr
    7878  # radarr
    9696  # prowlarr
    8080  # qbittorrent
  ];
}
