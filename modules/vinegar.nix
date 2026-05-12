{ pkgs, ... }:

{
  programs.vinegar = {
    enable = true;
    package = pkgs.vinegar;
  };
}
