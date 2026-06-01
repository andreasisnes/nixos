{ lib, config, ... }:
let
  cfg = config.host;
in {
  options.host = {
    hostname     = lib.mkOption { type = lib.types.str; };
    username     = lib.mkOption { type = lib.types.str; };
    stateVersion = lib.mkOption { type = lib.types.str; };
    gitUsername  = lib.mkOption { type = lib.types.str; };
    gitEmail     = lib.mkOption { type = lib.types.str; };
    timeZone     = lib.mkOption { type = lib.types.str; default = "UTC"; };
    console.keyMap = lib.mkOption { type = lib.types.str; default = "us"; };
    i18n = {
      defaultLocale       = lib.mkOption { type = lib.types.str; default = "en_US.UTF-8"; };
      extraLocaleSettings = lib.mkOption { type = lib.types.attrsOf lib.types.str; default = {}; };
    };
  };

  config = {
    _module.args.host = cfg;

    networking.hostName      = cfg.hostname;
    time.timeZone            = cfg.timeZone;
    console.keyMap           = cfg.console.keyMap;
    i18n.defaultLocale       = cfg.i18n.defaultLocale;
    i18n.extraLocaleSettings = cfg.i18n.extraLocaleSettings;
  };
}
