{
  description = "apia's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager?ref=release-26.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=v0.7.0";
    wifi-manager.url = "github:Vijay-papanaboina/wifi-manager";
    noctalia = {
     url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      pkgsUnstable = inputs.nixpkgs-unstable.legacyPackages.${system};
    in {
    nixosConfigurations.viva = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./viva/configuration.nix
        home-manager.nixosModules.home-manager
        ({ config, ... }: {
          home-manager.extraSpecialArgs = {
            pkgsUnstable = import nixpkgs-unstable {
              inherit system;
              config = config.nixpkgs.config;
              overlays = config.nixpkgs.overlays;
            };
          };
        })
      ];
    };
    nixosConfigurations.andan = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./andan/configuration.nix
        ./andan/noctalia.nix
      ];
    };
  };
}
