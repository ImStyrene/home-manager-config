{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;

    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    prefix = "M-`";
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      resurrect
      continuum
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_theme night
        '';
      }
    ];
    extraConfig = ''
      set -g renumber-windows on
      set -ga terminal-overrides ",xterm*:Tc"
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind -T -n | split-window -h
      bind -T -n - split-window -v
    '';
  };
}
