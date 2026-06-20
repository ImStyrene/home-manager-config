{
  description = "Home Manager configuration for Styrene";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    systems.url = "github:nix-systems/default/future-26.11";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.systems.follows = "systems";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-stable, systems, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs_stable = nixpkgs-stable.legacyPackages.${system};
    in {
      homeConfigurations."Styrene" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          nixvim.homeModules.nixvim
        ];
        extraSpecialArgs = {
          inherit pkgs_stable;
        };
      };
    };
}
