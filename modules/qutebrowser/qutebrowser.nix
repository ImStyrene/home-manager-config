{ pkgs, config, ... }:

let
  wallpapersDir = "${config.home.homeDirectory}/.config/home-manager/modules/qutebrowser/wallpapers";
  wallpaperList = ["mountains.jpg" "nixos-gray.jpg" "nixos-with-shade.png"];
  wallpapersJs = pkgs.writeText "wallpapers.js" "const WALLPAPERS = ${builtins.toJSON wallpaperList};\n";
in
{
  programs.qutebrowser = {
    enable = true;
    package = pkgs.qutebrowser;

    searchEngines = {
      "aw" = "https://wiki.archlinux.org/index.php?search={}&title=Special%3ASearch&fulltext=1";
      "nw" = "https://wiki.nixos.org/w/index.php?search={}";
      "inv" = "https://invidious.nerdvpn.de/search?q={}";
      "np" = "https://search.nixos.org/packages?channel=unstable&query={}";
      "no" = "https://search.nixos.org/options?channel=unstable&query={}";
    };

    keyBindings = {
      normal = {
        ",r" = "config-source";
        "tdm" = "config-cycle colors.webpage.darkmode.enabled true false";
        ",m" = "hint links spawn mpv mpv --player-operation-mode=pseudo-gui {hint-url}";
	"yl" = "hint links yank";
      };
    };

    settings = {
      url = {
        default_page = "file://${config.xdg.configHome}/qutebrowser/index.html";
        start_pages = ["file://${config.xdg.configHome}/qutebrowser/index.html"];
      };

      tabs = {
        position = "top";
        show = "switching";
      };

      statusbar.show = "in-mode";

      content.user_stylesheets = ["${config.xdg.configHome}/qutebrowser/darkmode-fixes.css"];

      colors = {
        webpage = {
          preferred_color_scheme = "dark";
          darkmode.enabled = true;
        };

        completion = {
          fg = "#c0caf5";
          odd.bg = "#16161e";
          even.bg = "#1a1b26";
          category = {
            fg = "#7aa2f7";
            bg = "#16161e";
            border = {
              top = "#16161e";
              bottom = "#16161e";
            };
          };
          item.selected = {
            fg = "#c0caf5";
            bg = "#364a82";
            border = {
              top = "#364a82";
              bottom = "#364a82";
            };
            match.fg = "#ff9e64";
          };
          match.fg = "#ff9e64";
          scrollbar = {
            fg = "#3b4261";
            bg = "#16161e";
          };
        };

        contextmenu = {
          disabled = {
            bg = "#16161e";
            fg = "#737aa2";
          };
          menu = {
            bg = "#16161e";
            fg = "#c0caf5";
          };
          selected = {
            bg = "#364a82";
            fg = "#c0caf5";
          };
        };

        downloads = {
          bar.bg = "#16161e";
          start = {
            fg = "#1a1b26";
            bg = "#7aa2f7";
          };
          stop = {
            fg = "#1a1b26";
            bg = "#9ece6a";
          };
          error.fg = "#db4b4b";
        };

        hints = {
          fg = "#1a1b26";
          bg = "#e0af68";
          match.fg = "#9ece6a";
        };

        keyhint = {
          fg = "#c0caf5";
          suffix.fg = "#e0af68";
          bg = "#16161e";
        };

        messages = {
          error = {
            fg = "#db4b4b";
            bg = "#1a1b26";
            border = "#db4b4b";
          };
          warning = {
            fg = "#e0af68";
            bg = "#1a1b26";
            border = "#e0af68";
          };
          info = {
            fg = "#0db9d7";
            bg = "#1a1b26";
            border = "#0db9d7";
          };
        };

        prompts = {
          fg = "#c0caf5";
          border = "#27a1b9";
          bg = "#16161e";
          selected = {
            bg = "#364a82";
            fg = "#c0caf5";
          };
        };

        statusbar = {
          normal = {
            fg = "#7aa2f7";
            bg = "#16161e";
          };
          insert = {
            fg = "#9ece6a";
            bg = "#292e42";
          };
          passthrough = {
            fg = "#7aa2f7";
            bg = "#292e42";
          };
          private = {
            fg = "#9d7cd8";
            bg = "#292e42";
          };
          command = {
            fg = "#c0caf5";
            bg = "#16161e";
            private = {
              fg = "#9d7cd8";
              bg = "#292e42";
            };
          };
          caret = {
            fg = "#bb9af7";
            bg = "#292e42";
            selection = {
              fg = "#7dcfff";
              bg = "#292e42";
            };
          };
          progress.bg = "#7aa2f7";
          url = {
            fg = "#c0caf5";
            error.fg = "#db4b4b";
            hover.fg = "#7dcfff";
            success = {
              http.fg = "#e0af68";
              https.fg = "#73daca";
            };
            warn.fg = "#e0af68";
          };
        };

        tabs = {
          bar.bg = "#15161e";
          indicator = {
            start = "#7aa2f7";
            stop = "#9ece6a";
            error = "#db4b4b";
          };
          odd = {
            fg = "#545c7e";
            bg = "#292e42";
          };
          even = {
            fg = "#545c7e";
            bg = "#292e42";
          };
          pinned = {
            even = {
              bg = "#292e42";
              fg = "#545c7e";
            };
            odd = {
              bg = "#292e42";
              fg = "#545c7e";
            };
            selected = {
              even = {
                fg = "#1a1b26";
                bg = "#bb9af7";
              };
              odd = {
                fg = "#1a1b26";
                bg = "#bb9af7";
              };
            };
          };
          selected = {
            odd = {
              fg = "#1a1b26";
              bg = "#bb9af7";
            };
            even = {
              fg = "#1a1b26";
              bg = "#bb9af7";
            };
          };
        };

        tooltip = {
          bg = "#16161e";
          fg = "#c0caf5";
        };
      };
    };

    loadAutoconfig = false;
  };

  xdg.configFile = {
    "qutebrowser/darkmode-fixes.css".source = ./darkmode-fixes.css;
    "qutebrowser/index.html".source = ./index.html;
    "qutebrowser/wallpapers.js".source = wallpapersJs;
    "qutebrowser/wallpapers".source = config.lib.file.mkOutOfStoreSymlink wallpapersDir;
  };
}
