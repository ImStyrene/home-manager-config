{ config, lib, pkgs, ... }:

let
  scanDir = dir:
    let
      entries = builtins.readDir dir;
      files = builtins.attrNames entries;
      nixFiles = map (f: "${dir}/${f}") (lib.filter (lib.hasSuffix ".nix") files);
      subdirs = lib.filter (d: entries.${d} == "directory") files;
      subFiles = lib.flatten (map (d: scanDir "${dir}/${d}") subdirs);
    in
    nixFiles ++ subFiles;
  moduleImport = scanDir ./modules;
in {
  imports = moduleImport;

  # === INFO === #
  home = {
    username = "Styrene";
    homeDirectory = "/home/Styrene";
    stateVersion = "25.05";
  };

  # === PACKAGES === #
  home.packages = with pkgs; [
    kdePackages.kdenlive
    audacity
    pear-desktop
  ];
}
