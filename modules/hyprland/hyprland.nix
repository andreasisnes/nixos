{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true; # system-wide, needed for session in tuigreet
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled
  };
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    configPackages = [ pkgs.hyprland ];
  };

  home.xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland # Hyprland-specific portal
    ];
    config.common.default = [ "hyprland" ];
  };
  home = {
    imports = [
      ./keybinds.nix
      ./windows.nix
      ./visual.nix
      ./hypridle.nix
      ./hyprlock.nix
    ];

    home = {
      packages = with pkgs; [
        grim
        slurp
        wl-clipboard
        hyprpicker # Color picker
        ydotool
      ];

      pointerCursor = {
        package = pkgs.catppuccin-cursors.macchiatoLavender;
        name = "catppuccin-macchiato-lavender-cursors";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };
      
      sessionVariables = {
        TERMINAL = "ghostty";
        NIXOS_OZONE_WL = "1";
        NIXPKGS_ALLOW_UNFREE = "1";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
        GDK_BACKEND = "wayland,x11";
        CLUTTER_BACKEND = "wayland";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        SDL_VIDEODRIVER = "wayland,x11";
        EDITOR = "nvim";
        MOZ_ENABLE_WAYLAND = "1";
      };
    };

    systemd.user.targets.hyprland-session.Unit.Wants = [
      "xdg-desktop-autostart.target"
    ];
    services.hyprpolkitagent.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      systemd.enable = false;
      configType = "hyprlang";
      xwayland = {
        enable = true;
      };

      settings = {
        ecosystem = {
          no_donation_nag = true;
          no_update_news = false;
        };

        cursor = {
          no_hardware_cursors = false;
        };

        exec = [
          "hyprctl setcursor catppuccin-macchiato-lavender-cursors 24"
        ];

        # Commands executed once on Hyprland startup
        exec-once = [
          "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          # System tray applets and agents

          "noctalia-shell"
          "vicinae server"
          "nm-applet --indicator"
        ];
      };

      # Monitor configuration
      extraConfig = ''
        monitor=,preferred,auto,auto
        monitor=HDMI-A-1,preferred,auto,auto,transform, 3
      '';
    };
  };
}
