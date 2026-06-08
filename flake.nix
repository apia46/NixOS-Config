{
  description = "apia's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    home-manager.url = "github:nix-community/home-manager?ref=release-26.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=v0.7.0";
    wifi-manager.url = "github:Vijay-papanaboina/wifi-manager";
  };

  outputs = { nixpkgs, ... } @ inputs: {
    nixosConfigurations.viva = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./viva/configuration.nix
      ];
    };
    nixosConfigurations.andan = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./andan/configuration.nix
      ];
    };
  };
}
