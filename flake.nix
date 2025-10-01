{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-easyroam.url = "github:0x5a4/nix-easyroam";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    sops-nix,
    nix-easyroam,
  }: {
    nixosConfigurations.esgaroth = nixpkgs.lib.nixosSystem {
      modules = [
        ./host/esgaroth/configuration.nix
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        sops-nix.nixosModules.sops
        nix-easyroam.nixosModules.nix-easyroam
      ];
    };
  };
}
