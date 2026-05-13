{
  description = "Home Manager configuration for Styrene";

  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pkgs_stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "pkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."Styrene" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          nixvim.homeModules.nixvim
        ];
      };
    };
}
