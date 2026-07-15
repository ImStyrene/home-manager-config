{ config, lib, pkgs, pkgs_stable, ... }:

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
    stateVersion = "26.05";
  };

  # === PACKAGES === #
  home.packages = with pkgs; [

    # - Utilities - #
    imagemagick
    inkscape
    jp2a
    anydesk
    signal-desktop
    tor-browser
    handbrake

    # - Games - #
    steam

    # - Editing - #
    kdePackages.kdenlive
    python314Packages.openai-whisper
    python314Packages.srt
    audacity

    # - Music - #
    pear-desktop
    lmms

    # - Productivity - #
    proton-vpn
    fokus

    # - Creativity - #
    blender
    krita

    # - Fun - #
    cava
    easyeffects

    # - Languages - #
    go

  ] ++ (with pkgs_stable; [
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
      permittedInsecurePackages = [
        "librewolf-unwrapped-151.0.2-1"
        "librewolf-151.0.2-1"
      ];
    };
  };
}
