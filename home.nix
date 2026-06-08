{ configs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "apia";
  home.homeDirectory = "/home/apia";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    github-desktop
    godot
    musescore
    obsidian
    libreoffice
    git
    mariadb
    krita
    fastfetch
    mpv
    devenv
    olympus
    ffmpeg
    losslesscut
    gh
    # window manager stuff
    xwayland-satellite
    playerctl
    mpvpaper
    cliphist
    wl-clipboard
    fuzzel
    swaylock
    mako
    swayidle
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  xdg.configFile."niri/config.kdl".source = niri/config.kdl;

  home.pointerCursor = {
    enable = true;
    package = with pkgs; capitaine-cursors;
    size = 32;
    name = "capitaine-cursors-white";
  };

  programs.discord = {
    enable = true;
    settings = {
      SKIP_HOST_UPDATE = true;
      MIN_WIDTH = 100;
      MIN_HEIGHT = 100;
    };
  };

  programs.vscodium = {
    # package = pkgs.vscodium.overrideAttrs (prev : {
    #   patches = (prev.patches or []) ++ [
    #     vscodium/transparent-windows.patch
    #   ];
    # });
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      rust-lang.rust-analyzer
      ritwickdey.liveserver
      geequlim.godot-tools
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "tera";
        publisher = "karunamurti";
        version = "0.0.9";
        sha256 = "sha256-e72lZXg//vCZwoggRrpJlYiNUMxID3rkDLLBtV1b098";
      }
      {
        name = "kdl";
        publisher = "kdl-org";
        version = "2.1.3";
        sha256 = "sha256-Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM";
      }
      {
        name = "devenv";
        publisher = "datakurre";
        version = "0.6.0";
        sha256 = "sha256-GyDiPwC7WKxQNDfa96AW3RUKV9w0FsfAiuvxjr9B3UU=";
      }
    ];
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.input-overlay
      obs-studio-plugins.obs-pipewire-audio-capture
    ];
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "~/System/rebuild.sh";
    };
  };

  programs.kitty = {
    enable = true;
    settings = {
      background = "#272637";
      background_opacity = 0.5;
      background_blur = 4;
    };
  };

  programs.yazi = {
    enable = true;
    
  };

  programs.waybar = {
    enable = true;
    settings.main = {
      position = "bottom";
      height = 16;
      modules-left = ["custom/power"];
      modules-right = ["cpu" "memory" "network" "clock"];
      cpu = {
        format = "{usage}% ";
      };
      memory = {
        format = "{}% ";
      };
      network = {
        format-wifi = "{signalStrength}% ";
        on-click = "wifi-manager --toggle";
      };
      clock = {
        format = "{:%F %H:%M}";
      };

      "custom/power" = {
        format = "⏻ ";
        tooltip = false;
        menu = "on-click";
        menu-file = "$HOME/.config/waybar/power_menu.xml";
        menu-actions = {
          shutdown = "shutdown now";
          reboot = "reboot";
          suspend = "systemctl suspend";
          hibernate = "systemctl hibernate";
        };
      };
    };
  };

  services.polkit-gnome.enable = true; # polkit
}
