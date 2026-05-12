{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;

    history = {
      size = 100;
      save = 100;
      path = "${config.home.homeDirectory}/.zsh_history";
      append = true;
      share = true;
      ignoreSpace = true;
    };

    shellAliases = {
      ls = "ls --color";
      xvim = "~/.nix-profile/bin/nvim";
      xvim-update = "nix profile upgrade nixvim/.config/nixvim";
      nixos-generation-list = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system/";
      sober-ro = "chmod 444 ~/sober.conf.json";
      sober-rw = "chmod 644 ~/sober.conf.json";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      # ====================
      # COMPLETION & STYLING
      # ====================
    
      # Colorized completion menu
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
    
      # FZF tab preview for cd command
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
    
      # =========
      # FUNCTIONS
      # =========
    
      fm() {
	  fff "$@"
	  cd "$(cat "''${XDG_CACHE_HOME:-''${HOME}/.cache}/fff/.fff_d")"
      }
    
      # =============
      # AUTO-COMMANDS
      # =============
    
      fastfetch
    '';

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-completions";
          rev = "master";
          hash = "sha256-z5ZiBOkqM3Q7ejuIBbNxLJ7dgZPsp5EEy+ZYBTiQvew=";
        };
      }

      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "master";
          hash = "sha256-yvPQyuK4Dw+LkwxrkWTRcw4PIf/79fW61jWbEg8Pe9Y=";
        };
      }
    ];
  };

  programs.starship = {
    enable = true;
    package = pkgs.starship;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    package = pkgs.fzf;
    enableZshIntegration = true;
  };
}
