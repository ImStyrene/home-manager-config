{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    package = pkgs.picom;

    backend = "glx";
    vSync = true;
    fade = true;
    fadeDelta = 5;
    fadeSteps = [ 0.03 0.03 ];
    shadow = true;
    shadowOpacity = 0.5;
    shadowOffsets = [ (-12) (-12) ];
    activeOpacity = 1.0;
    inactiveOpacity = 0.85;
    settings = {
      inactive-dim = 0.08;
      inactive-dim-fixed = true;
      blur = {
        method = "dual_kawase";
        strength = 4;
      };
      paint-on-overlay = true;
      unredir-if-possible = true;
      use-damage = false;
    };
  };
}
