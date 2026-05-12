{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    package = pkgs.mpv;
    config = {
      keep-open = true;
      volume = "60";
      ytdl-format = "bestvideo[height<=720]+bestaudio/best[405]";
    };
    scripts = with pkgs.mpvScripts; [
      memo
    ];
    bindings = {
      END = "seek 100 absolute-percent";
    };
  };
}
