{ configs, pkgs, pkgsUnstable, ... }:

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
    wineWow64Packages.stable
    winetricks
    pkgsUnstable.musescore
    obsidian
    libreoffice
    git
    aseprite
    steam
    gh
    mpv
    kdePackages.filelight
    dotnetCorePackages.dotnet_10.sdk
    # window manager stuff
    xwayland-satellite
    cliphist
    wl-clipboard
    fuzzel
    yazi
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "net.waterfox.waterfox.desktop";
    };
  };

  home.pointerCursor = {
    enable = true;
    package = with pkgs; phinger-cursors;
    size = 24;
    name = "phinger-cursors-light";
  };

  programs.kitty = {
    enable = true;
    settings.confirm_os_window_close = 0;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "${../rebuild.sh}";
      gc = "sudo nix-collect-garbage -d";
    };
  };

  xdg.configFile."niri/config.kdl".source = niri/config.kdl;
  

  programs.vscodium = {
    enable = true;
    mutableExtensionsDir = true;
    profiles.default = {
      userSettings = builtins.fromJSON (builtins.readFile ../vscodeSettings.json);
      extensions = with pkgs.vscode-extensions; [
        mkhl.direnv
        bbenoist.nix
        rust-lang.rust-analyzer
        ritwickdey.liveserver
        geequlim.godot-tools
        ms-dotnettools.csharp
        ms-dotnettools.vscode-dotnet-runtime
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "tera";
          publisher = "karunamurti";
          version = "0.0.9";
          sha256 = "sha256-e72lZXg//vCZwoggRrpJlYiNUMxID3rkDLLBtV1b098";
        }
        {
          name = "kylin-cmake-tools";
          publisher = "kylinideteam";
          version = "0.3.1";
          sha256 = "sha256-Fk4Kln9VmuR24KjY+yfyKmrkv9LBYBBwOLJXATpzZ7k=";
        }
        {
          name = "kylin-clangd";
          publisher = "kylinideteam";
          version = "0.6.0";
          sha256 = "sha256-JWghoSokd93NCTN7+LwFkyIxzZBoZ0mc77aNDr+BdJk=";
        }
        {
          name = "cppdebug";
          publisher = "kylinideteam";
          version = "0.4.0";
          sha256 = "sha256-7biMU0hWmQu5oNHnuSady0iOVLJTvlWj1Dli52xPg/w=";
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

  home.file.".local/share/godot/export_templates/4.6.3.stable".source = "${pkgs.godot_4-export-templates-bin}/share/godot/export_templates/4.6.3.stable";
  home.file.".local/share/godot/export_templates/4.6.3.stable.mono".source = "${pkgs.godotPackages_4.export-templates-mono-bin}/share/godot/export_templates/4.6.3.stable.mono";
}
