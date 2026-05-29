{ pkgs, config, lib, ... }:

let
  preview = pkgs.writeShellScript "lf-preview" ''
    path="$1"
    w="$2"
    h="$3"
    x="$4"
    y="$5"

    cache="$HOME/.cache/lf/thumb.$(echo -n "$path" | ${pkgs.coreutils}/bin/md5sum | cut -d' ' -f1)"
    mkdir -p "$(dirname "$cache")"

    mime=$(${pkgs.file}/bin/file --mime-type -Lb -- "$path" 2>/dev/null)

    case "$mime" in
      image/*)
        ${pkgs.chafa}/bin/chafa --format=kitty --size="''${w}x''${h}" "$path" < /dev/null > /dev/tty
        exit 1
        ;;

      video/*)
        thumb="''${cache}.jpg"
        if [ ! -f "$thumb" ]; then
          ${pkgs.ffmpegthumbnailer}/bin/ffmpegthumbnailer -i "$path" -o "$thumb" -s 0 -q 5 2>/dev/null || true
        fi
        [ -f "$thumb" ] && ${pkgs.chafa}/bin/chafa --format=kitty --size="''${w}x''${h}" "$thumb" < /dev/null > /dev/tty
        exit 1
        ;;

      application/pdf)
        thumb="''${cache}.jpg"
        if [ ! -f "$thumb" ]; then
          ${pkgs.poppler-utils}/bin/pdftoppm -jpeg -f 1 -singlefile "$path" "$cache" 2>/dev/null || true
        fi
        [ -f "$thumb" ] && ${pkgs.chafa}/bin/chafa --format=kitty --size="''${w}x''${h}" "$thumb" < /dev/null > /dev/tty
        exit 1
        ;;

      text/*|inode/x-empty|application/json|application/xml|application/yaml|application/toml|application/javascript)
        ${pkgs.bat}/bin/bat --color=always --style=numbers --paging=never "$path" 2>/dev/null || cat "$path"
        exit 0
        ;;

      inode/directory)
        ${pkgs.coreutils}/bin/ls -1 "$path" 2>/dev/null || echo "empty"
        exit 0
        ;;

      application/gzip|application/x-bzip2|application/x-xz|application/zip|application/x-tar|application/x-7z-compressed|application/x-rar|application/vnd.rar)
        ${pkgs.file}/bin/file -Lb -- "$path" | ${pkgs.coreutils}/bin/fold -s -w "$w"
        exit 0
        ;;

      application/x-sharedlib|application/x-executable|application/x-elf)
        ${pkgs.bat}/bin/bat --color=always "$path" 2>/dev/null || ${pkgs.file}/bin/file -Lb "$path"
        exit 0
        ;;

      *)
        if [ -f "$path" ]; then
          ${pkgs.bat}/bin/bat --color=always "$path" 2>/dev/null || ${pkgs.file}/bin/file -Lb "$path"
        fi
        exit 0
        ;;
    esac
  '';

  cleaner = pkgs.writeShellScript "lf-cleaner" ''
    printf '\e_Ga=d\e\\'
  '';
in
{
  programs.lf = {
    enable = true;
    package = pkgs.lf;

    settings = {
      preview = true;
      hidden = false;
      icons = true;
      drawbox = true;
      relativenumber = true;
      incsearch = true;
      tabstop = 4;
      ratios = [ 1 2 3 ];
      previewer = "${preview}";
      cleaner = "${cleaner}";
    };

    commands = {
      mkdir = ''%mkdir -p "$f"'';
      mkfile = ''&printf "File name: " && read ans && $EDITOR "$ans"'';
      extract = ''%{
        case "$f" in
          *.tar*) tar xf "$f" ;;
          *.zip) unzip "$f" ;;
          *.rar) unrar x "$f" ;;
          *.7z) 7z x "$f" ;;
          *) echo "Unsupported format" ;;
        esac
      }'';
      trash = ''%mkdir -p ~/.local/share/Trash/files && mv "$f" ~/.local/share/Trash/files'';
    };

    keybindings = {
      # vim-style navigation
      gh = "cd ~";
      "." = "set hidden!";
      "g~" = "cd ~";

      # file operations (ranger-style)
      y = "copy";
      p = "paste";
      d = "cut";
      D = "trash";
      dd = "cut";
      yy = "copy";
      pp = "paste";

      # open / edit
      "<enter>" = "open";
      v = "$EDITOR $f";
      e = "open";
      S = "$SHELL";

      # mkdir / mkfile
      md = "mkdir";
      mf = "mkfile";

      # extract archives
      x = "extract";

      # quit
      q = "quit";
    };

    previewer.source = preview;
    previewer.keybinding = "i";

    extraConfig = ''
      set colors #c0caf5,#7dcfff,#89ddff,#f7768e,#ff5370,#e0af68,#ff9e64,#ff5370,#ff9e64,#9ece6a:#2d3346,#db4b4b:#2d3346,#9ece6a
    '';
  };

  home.packages = with pkgs; [
    bat
    chafa
    ffmpegthumbnailer
    poppler-utils
    file
  ];
}
