{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager}: {
    nixosConfigurations.esgaroth = nixpkgs.lib.nixosSystem {
      modules = [
      ./host/esgaroth/configuration.nix 
      home-manager.nixosModules.home-manager
      ];
    };
  };
}
