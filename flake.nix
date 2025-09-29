{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix}: {
    nixosConfigurations.esgaroth = nixpkgs.lib.nixosSystem {
      modules = [
      ./host/esgaroth/configuration.nix 
      home-manager.nixosModules.home-manager
      stylix.nixosModules.stylix
      ];
    };
  };
}
