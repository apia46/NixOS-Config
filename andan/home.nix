{ configs, pkgs, inputs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.username = "apia";
  home.homeDirectory = "/home/apia";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    discord
    github-desktop
    godot
    godot-mono
    wine
    musescore
    obsidian
    libreoffice
    git
    aseprite
    steam
    gh
    mpv
    dotnetCorePackages.dotnet_10.sdk
    # window manager stuff
    xwayland-satellite
    # cliphist
    # wl-clipboard
    fuzzel
    yazi
  ];

  home.pointerCursor = {
    enable = true;
    package = with pkgs; capitaine-cursors;
    size = 32;
    name = "capitaine-cursors-white";
  };

  programs.kitty = {
    enable = true;
    settings.confirm_os_window_close = 0;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "${../rebuild.sh}";
      gc = "sudo nix-collect-garbage";
    };
  };

  xdg.configFile."niri/config.kdl".source = niri/config.kdl;
  

  programs.vscodium = {
    enable = true;
    profiles.default = {
      userSettings = builtins.fromJSON (builtins.readFile ../vscodeSettings.json);
      extensions = with pkgs.vscode-extensions; [
        mkhl.direnv
        bbenoist.nix
        geequlim.godot-tools
        ms-dotnettools.csharp
        ms-dotnettools.vscode-dotnet-runtime
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "kylin-cpp-pack";
          publisher = "KylinIdeTeam";
          version = "0.2.0";
        #   sha256 = "sha256-NMGIijmTb9DNgEKvQdaIeWt688ztZjgte8m2ZPMg8r4=";
        }
        {
          name = "kdl";
          publisher = "kdl-org";
          version = "2.1.3";
          sha256 = "sha256-Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM";
        }
      ];
    };
  };

  home.file.".local/share/godot/export_templates/${builtins.replaceStrings [ "-" ] [ "." ] pkgs.godotPackages_4_6.export-template-mono.version}".source = pkgs.godotPackages_4_6.export-template-mono;
}
