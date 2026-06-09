{ configs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "apia";
  home.homeDirectory = "/home/apia";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    discord
    github-desktop
    godot-mono
    wine
    musescore
    obsidian
    libreoffice
    git
    aseprite
    steam
    dotnetCorePackages.dotnet_9.sdk
    gh
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      gc = "sudo nix-collect-garbage";
    };
  };

  programs.vscodium = {
    enable = true;
    profiles.default = {
		userSettings = {
			"dotnetAcquisitionExtension.sharedExistingDotnetPath" = "${pkgs.dotnet-sdk_9}/bin";
			"godotTools.lsp.serverPort" = 6005; # port should match your Godot configuration
			"godotTools.editorPath.godot4" = "/home/apia/.nix-profile/bin/godot-mono";
			"workbench.colorTheme" = "Tomorrow Night Blue";
		};
		extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
			geequlim.godot-tools
			ms-dotnettools.csharp
			ms-dotnettools.vscode-dotnet-runtime
		];
	};
  };

  home.file.".local/share/godot/export_templates/${builtins.replaceStrings [ "-" ] [ "." ] pkgs.godotPackages_4_6.export-template-mono.version}".source = pkgs.godotPackages_4_6.export-template-mono;
}
