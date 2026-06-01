{ pkgs, host, ... }:
{
  environment.systemPackages = with pkgs; [
    zsh-history-substring-search
  ];
  system.userActivationScripts.zshrc = "touch .zshrc";
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "dieter";
    };

    autosuggestions = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };

    histSize = 20000;

    shellAliases = {
    };
  };
}