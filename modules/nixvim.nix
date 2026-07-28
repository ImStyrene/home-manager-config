{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    # === GLOBALS === #
    globals.mapleader = " ";

    # === OPTIONS === #
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    # === KEYMAPS === #
    keymaps = [
      # - Oil - #
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Oil<CR>";
        options.desc = "󰏇 Open Oil";
      }

      # - Dashboard - #
      {
        mode = "n";
        key = "<leader>h";
        action = "<cmd>Dashboard<CR>";
        options.desc = "󰕮 Open Dashboard";
      }

      # - Neogit - #
      {
        mode = "n";
        key = "<leader>gm";
        action = "<cmd>Neogit<CR>";
        options.desc = " Open NeoGit";
      }
      {
        mode = "n";
        key = "<leader>gc";
        action = "<cmd>Neogit commit<CR>";
        options.desc = " NeoGit Commit";
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>Neogit push<CR>";
        options.desc = " NeoGit Push";
      }
      {
        mode = "n";
        key = "<leader>gl";
        action = "<cmd>Neogit pull<CR>";
        options.desc = " NeoGit pull";
      }

      # - Editor - #
      {
        mode = "n";
        key = "\\";
        action = "<cmd>nohlsearch<CR>";
        options.desc = "Clear search highlights";
      }
    ];

    # === COLORSCHEMES === #
    colorschemes.tokyonight.enable = true;

    # === PLUGINS === #

    plugins = {

      # - nvim-autopairs - #
      nvim-autopairs.enable = true;

      # - telescope - #
      telescope.enable = true;

      # - oil - #
      oil.enable = true;

      # - bufferline - #
      bufferline.enable = true;

      # - web-devicons - #
      web-devicons.enable = true;

      # - lualine - #
      lualine.enable = true;

      # - which-key - #
      which-key.enable = true;

      # - snacks - #
      snacks.enable = true;

      # - luasnip - #
      luasnip.enable = true;

      # - multicursors - #
      multicursors = {
        enable = true;
        settings = {
          generate_hints = {
            normal = true;
            insert = true;
            extend = true;
          };
          hint_config = {
            float_opts.border = "rounded";
            position = "bottom-right";
          };
        };
      };

      # - cmp (autocompletion) - #
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({select = true})";
            "<Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
            "<S-Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
          };
        };
      };

      # - treesitter - #
      treesitter = {
        enable = true;
        settings = {
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = false;
          };
          ensure_installed = [
            "lua"
            "python"
            "javascript"
            "typescript"
            "json"
            "yaml"
            "markdown"
            "bash"
            "html"
            "css"
            "go"
            "rust"
            "java"
            "c"
            "cpp"
            "sql"
            "ruby"
            "php"
            "toml"
            "vim"
            "dockerfile"
            "graphql"
            "proto"
          ];
          incremental_selection.enable = true;
          indent.enable = true;
        };
      };

      # - lsp - #
      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true;
          lua_ls.enable = true;
          nixd.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };

      # - neogit - #
      neogit = {
        enable = true;
        settings = {
          integrations = {
            telescope = true;
            diffview = true;
          };
          signs = {
            hunk = [ "" "" ];
            item = [ "" "" ];
            section = [ "" "" ];
          };
          graph_style = "unicode";
          kind = "tab";
          commit_editor = {
            kind = "tab";
            show_staged_diff = true;
          };
          sections = {
            untracked.hidden = false;
            unstaged.hidden = false;
            staged.hidden = false;
            stashes.hidden = true;
            unpulled_upstream.hidden = true;
            unmerged_upstream.hidden = false;
            unpulled_pushRemote.hidden = true;
            unmerged_pushRemote.hidden = false;
            recent.hidden = true;
          };
          auto_refresh = true;
          use_default_keymaps = true;
        };
      };

      # - diffview - #
      diffview.enable = true;

      # - dashboard - #
      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          config = {
            header = [
              ""
              ""
              ""
              "                                                                  "
              "                                                                  "
              "   _..._   .--.             .----.     .----..--. __  __   ___    "
              " .'     '. |__|              \\    \\   /    / |__||  |/  `.'   `.  "
              ".   .-.   ..--.               '   '. /'   /  .--.|   .-.  .-.   ' "
              "|  '   '  ||  | ____     _____|    |'    /   |  ||  |  |  |  |  | "
              "|  |   |  ||  |`.   \\  .'    /|    ||    |   |  ||  |  |  |  |  | "
              "|  |   |  ||  |  `.  `'    .' '.   `'   .'   |  ||  |  |  |  |  | "
              "|  |   |  ||  |    '.    .'    \\        /    |  ||  |  |  |  |  | "
              "|  |   |  ||__|    .'     `.    \\      /     |__||__|  |__|  |__| "
              "|  |   |  |      .'  .'`.   `.   '----'                           "
              "|  |   |  |    .'   /    `.   `.                                  "
              "'--'   '--'   '----'       '----'                                 "
              ""
              ""
              ""
            ];
            center = [
              {
                icon = "󰈔 ";
                icon_hl = "Title";
                desc = "New File";
                desc_hl = "String";
                key = "n";
                key_hl = "Number";
                action = "enew";
              }
              {
                icon = "󰈞 ";
                icon_hl = "Title";
                desc = "Find File";
                desc_hl = "String";
                key = "f";
                key_hl = "Number";
                action = "Telescope find_files";
              }
              {
                icon = "󰋚 ";
                icon_hl = "Title";
                desc = "Recent Files";
                desc_hl = "String";
                key = "r";
                key_hl = "Number";
                action = "Telescope oldfiles";
              }
              {
                icon = " ";
                icon_hl = "Title";
                desc = "Explorer";
                desc_hl = "String";
                key = "e";
                key_hl = "Number";
                action = "Oil";
              }
              {
                icon = " ";
                icon_hl = "Title";
                desc = "Configuration";
                desc_hl = "String";
                key = "c";
                key_hl = "Number";
                action = "cd ~/.config/home-manager/modules/nixvim.nix | e .";
              }
              {
                icon = "󰩈 ";
                icon_hl = "Title";
                desc = "Quit";
                desc_hl = "String";
                key = "q";
                key_hl = "Number";
                action = "quit";
              }
            ];
            footer = [
              ""
              "Made with NixVim 󱄅 "
            ];
          };
          hide = {
            statusline = true;
            tabline = true;
            winbar = true;
          };
        };
      };
    };

    # === EXTRA PLUGINS (mason) === #
    extraPlugins = with pkgs.vimPlugins; [
      mason-nvim
      mason-tool-installer-nvim
    ];

    # === AUTO COMMANDS === #
    autoCmd = [
      # - Redraw dashboard on resize - #
      {
        event = [ "VimResized" ];
        pattern = "*";
        callback.__raw = ''
          function()
            if vim.bo.filetype == "dashboard" then
              vim.cmd("Dashboard")
            end
          end
        '';
      }
    ];
  };
}
