{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nnn

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    jq
    yq-go

    nmap

    glow
    tree

    asciinema
    nixfmt
    progress
    watch
    tealdeer
    bandwhich
    jless
    thefuck
    ack
    gh
    magic-wormhole
    skhd
    xcodes
    nil
    nixpkgs-fmt
    _1password
  ];

  home.shellAliases = {
    "n" = "nix";
  };

  programs = {
    bat.enable = true;

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden --follow";
      defaultOptions = [ "-m --bind ctrl-a:select-all,ctrl-d:deselect-all" ];
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      history.ignoreAllDups = true;
      plugins = [
        {
          name = "zsh-autopair";
          src = pkgs.fetchFromGitHub {
            owner = "hlissner";
            repo = "zsh-autopair";
            rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
            sha256 = "sha256-PXHxPxFeoYXYMOC29YQKDdMnqTO0toyA7eJTSCV6PGE=";
          };
          file = "autopair.zsh";
        }
      ];
      syntaxHighlighting.enable = true;
      syntaxHighlighting.highlighters = [ "brackets" ];
      shellAliases = {
        fbat = "fzf --preview 'bat --color=always {}' --preview-window '~3'";
      };
    };

    git = {
      enable = true;
      userName = "mcn8";
      userEmail = "mccordnate@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "hx";
      };

      delta.enable = true;
    };

    neovim = {
      enable = false;
      defaultEditor = true;
      vimAlias = true;
    };

    eza = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };

    skim = {
      enable = true;
      enableBashIntegration = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };

    wezterm = {
      enable = true;
      enableZshIntegration = true;


      # ColorSchemes
      # config.color_scheme = 'Ocean Dark (Gogh)'
      # config.color_scheme = 'Twilight'

      extraConfig = ''
        local w = require('wezterm')
        local config = w.config_builder()
        config.bold_brightens_ansi_colors = "No"
        config.hide_mouse_cursor_when_typing = true
        config.color_scheme = 'Hacktober'
        config.font = w.font('IosevkaTerm Nerd Font Mono')
        config.font_size = 18
        config.font_shaper = "Harfbuzz"
        config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
        config.use_fancy_tab_bar = true
        config.hide_tab_bar_if_only_one_tab = true
        config.window_background_opacity = 0.9
        return config
      '';
    };

    zoxide = { enable = true; };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    helix = {
      enable = true;
      settings = {
        theme = "gruvbox_dark_hard";
        editor = {
          color-modes = true;
          bufferline = "multiple";
          lsp.display-messages = true;
          lsp.display-inlay-hints = true;

          indent-guides.render = true;
          indent-guides.character = "╎";
          indent-guides.skip-levels = 1;
          cursor-shape.insert = "bar";

          statusline = {
            left = [ "mode" "spinner" "version-control" ];
            center = [ "read-only-indicator" "file-name" ];
          };

          whitespace.render.tab = "all";
        };
        keys.normal = {
          space.w = ":w";
          space.q = ":q";
        };
      };
    };
  };
}
