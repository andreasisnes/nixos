{ pkgs, ...}:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  
  environment.systemPackages = with pkgs; [
    pkgs.jellyfin-desktop
  ];
}