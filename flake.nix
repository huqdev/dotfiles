{
  description = "roberts's nixos config. ein satz mit x, das war wohl nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    xfaf.url = "github:0x5a4/dotfiles/8f5f6242c6094bd9bb81daf92a1d7436a171bf71";
    marchcraft.url = "github:marchcraft/dotfiles";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];

    lib = nixpkgs.lib;

    forAllSystems = lib.genAttrs systems;
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations.esgaroth = lib.nixosSystem {
      specialArgs = {
        inherit outputs;
        inputs = inputs.xfaf.inputs // inputs;
      };
      modules = [./host/esgaroth];
    };
  };
}
