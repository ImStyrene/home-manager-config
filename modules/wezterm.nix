{ lib, pkgs, ... }:

let
  inherit (lib.generators) mkLuaInline;
in
{
  programs.wezterm = {
    enable = true;
    package = pkgs.wezterm;
    enableZshIntegration = true;
    settings = {
      font = mkLuaInline ''wezterm.font("CaskaydiaCoveNerdFont")'';
      font_size = 12.0;
      line_height = 1.05;
      window_background_opacity = 0.9;
      hide_tab_bar_if_only_one_tab = true;
      window_padding = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };
      kde_window_background_blur = true;
      color_scheme = "Tokyo Night Moon";
      keys = [ ];
      default_prog = [ "/run/current-system/sw/bin/zsh" ];
    };
    extraConfig = ''
      local mux = wezterm.mux
      wezterm.on("gui-startup", function(cmd)
          local tab, pane, window = mux.spawn_window(cmd or {})
          window:gui_window():maximize()
      end)
    '';
  };
}
