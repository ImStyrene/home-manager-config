{ pkgs, ... }:

{
  services.redshift = {
    enable = true;
    package = pkgs.redshift;

    tray = true;
    provider = "manual";
    latitude = 18.4823;
    longitude = -69.9344;
    temperature = {
      day = 5500;
      night = 2500;
    };
    settings = {
      redshift = {
	adjustment-method = "randr";
      };
    };
  };
}
