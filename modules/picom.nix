{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    package = pkgs.picom;
    backend = "glx";
    vSync = true;
    fade = false;
    shadow = false;
    fadeDelta = 5;
    inactiveOpacity = 1.0;
    settings = {
      paint-on-overlay = true;
      unredir-if-possible = true;
    };
  };
}
