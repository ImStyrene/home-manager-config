{ pkgs, ... }:

{
  programs.keepassxc ={
    enable = true;
    package = pkgs.keepassxc;
  };
}
