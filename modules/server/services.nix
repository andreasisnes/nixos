{ pkgs, ...}:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  services.sonarr = {
    enable = true;
    openFirewall = true;
  };

  services.radarr = {
    enable = true;
    openFirewall = true;
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  services.qbittorrent = {
    enable = true;
    group = "media";
    openFirewall = true;
    webuiPort = 8020;
  };

  environment.systemPackages = with pkgs; [
    pkgs.jellyfin-desktop
    pkgs.qbittorrent
  ];
}