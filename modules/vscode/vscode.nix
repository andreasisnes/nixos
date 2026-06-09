{
  pkgs,
  inputs,
  host,
  ...
}:
{
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];
  systemd.tmpfiles.rules = [
    "d  /home/${host.username}/.config/Code/User                  0755 ${host.username} users - -"
    "L+ /home/${host.username}/.config/Code/User/settings.json    -    ${host.username} users - ${host.flakePath}/modules/vscode/settings.json"
    "L+ /home/${host.username}/.config/Code/User/keybindings.json -    ${host.username} users - ${host.flakePath}/modules/vscode/keybindings.json"
  ];
  home = {
    home.packages = with pkgs; [
      shellcheck # Shell script analysis tool
      shfmt # Shell script formatter
    ];
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      mutableExtensionsDir = true;
      profiles.default = {
        extensions = with pkgs.vscode-marketplace; [
          # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/vscode-marketplace-latest.json
          # Essentials
          mikestead.dotenv
          christian-kohler.path-intellisense
          editorconfig.editorconfig
          jacobdufault.fuzzy-search
          alefragnani.project-manager

          # Interface Improvements
          # eamodio.gitlens
          pflannery.vscode-versionlens
          yoavbls.pretty-ts-errors
          wix.vscode-import-cost
          gruntfuggly.todo-tree

          # Web Dev
          # dbaeumer.vscode-eslint
          esbenp.prettier-vscode
          csstools.postcss
          stylelint.vscode-stylelint
          bradlc.vscode-tailwindcss
          davidanson.vscode-markdownlint
          unifiedjs.vscode-mdx
          # zenclabs.previewjs # Error: EROFS: read-only file system

          # Deno
          # denoland.vscode-deno

          # GraphQL
          graphql.vscode-graphql-syntax
          graphql.vscode-graphql

          # Nix
          jnoortheen.nix-ide
          # arrterian.nix-env-selector #like dev shells not needed rn

          # Bash
          mads-hartmann.bash-ide-vscode
          mkhl.shfmt

          # Themes
          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons

          #Testing
          rangav.vscode-thunder-client
          vitest.explorer
          ms-playwright.playwright
          firefox-devtools.vscode-firefox-debug
          ms-vscode.test-adapter-converter
          # mtxr.sqltools
          # mtxr.sqltools-driver-pg
          dbaeumer.vscode-eslint
          donjayamanne.githistory
          bierner.color-info
          golang.go
          usernamehw.errorlens
          # mtxr.sqltools-driver-sqlite
          tamasfe.even-better-toml
          ms-azuretools.vscode-containers
          ms-vscode-remote.remote-ssh
          ms-vscode-remote.vscode-remote-extensionpack
          ms-vscode.makefile-tools
          ms-vscode.remote-explorer
          inferrinizzard.prettier-sql-vscode
          ms-vsliveshare.vsliveshare
          # codeforge.remix-forge
          amodio.toggle-excluded-files
          # github.copilot
          # github.copilot-chat

          # .NET
          ms-dotnettools.csharp
          ms-dotnettools.vscode-dotnet-pack
          ms-dotnettools.vscode-dotnet-modernize
          ms-dotnettools.dotnet-maui
        ];
      };
    };
  };
}