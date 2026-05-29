{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
    package = pkgs.gh;

    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };
}
