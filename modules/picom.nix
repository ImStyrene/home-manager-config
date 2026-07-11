{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    package = pkgs.picom;

    backend = "glx";
    vSync = false;
    fade = false;
    shadow = false;
    settings = {
      use-damage = true;
      unredir-if-possible = false;
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5;
      };
    };
  };
}
