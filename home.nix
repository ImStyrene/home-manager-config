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

    # - Utilities - #
    imagemagick
    inkscape
    jp2a

    # - Editing - #
    kdePackages.kdenlive
    python314Packages.openai-whisper
    python314Packages.srt
    audacity

    # - Music - #
    pear-desktop
    lmms

    # - Productivity - #

    # - Creativity - #
    blender
    krita

    # - Fun - #
    cava

    # - Languages - #
    go
    
  ]
    ++
  (with pkgs_stable; [
    pomodoro-gtk
  ]);
  
  # === XDG === #
  xdg = {
    autostart = {
      enable = true;
    };
  };

  # === NIX-RELATED === #
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
