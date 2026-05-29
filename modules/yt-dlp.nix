{ pkgs, ... }:

{
  programs.yt-dlp = {
    enable = true;
    package = pkgs.yt-dlp;

    settings = {
      downloader = "aria2c";
      downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
    };
  };
}
