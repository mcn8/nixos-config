{ pkgs, nixvim, nix-doom-emacs, ... }:

{
  imports = [
    nixvim.homeManagerModules.nixvim
    nix-doom-emacs.hmModule
  ];

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
    croc
    qmk
  ];

  home.shellAliases = {
    "n" = "nix";
    "ec" = "emacsclient -c";
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
      initExtra = ''
        export PATH=$PATH:/Users/n8/.cargo/bin
      '';
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
      defaultEditor = false;
      vimAlias = false;
    };

    nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;

      options = {
        number = true;
        relativenumber = true;
        expandtab = true;
        autoindent = true;
        incsearch = true;
        termguicolors = true;
        clipboard = "unnamedplus";
        completeopt = [ "menuone" "noselect" ];
        ignorecase = true;
        undofile = true;
        undodir = "$HOME/.vim/undodir";
        showmatch = true;
        backspace = [ "indent" "start" "eol" ];
        softtabstop = 2;
        shiftwidth = 2;
        shiftround = true;
        splitbelow = true;
        splitright = true;
        shell = "zsh";
        cindent = true;
      };

      colorschemes.gruvbox.enable = true;

      plugins = {
        lsp = {
          enable = true;
          servers = {
            eslint.enable = true;
            pyright.enable = true;
            nil_ls.enable = true;
            #rust-analyzer.enable = true;
            bashls.enable = true;
            dockerls.enable = true;
            elixirls.enable = true;
            gopls.enable = true;
            jsonls.enable = true;
            lua-ls.enable = true;
            tailwindcss.enable = true;
            tsserver.enable = true;
          };
        };
        lualine = {
          enable = true;
          sections = {
            lualine_c = [{
              name = "filename";
              extraConfig = {
                path = 3;
              };
            }];
          };
        };
        trouble.enable = true;
        treesitter = {
          enable = true;
          ensureInstalled = [
            "bash"
            "c"
            "cpp"
            "css"
            "diff"
            "dockerfile"
            "elixir"
            "erlang"
            "gitignore"
            "go"
            "gomod"
            "html"
            "java"
            "javascript"
            "json"
            "latex"
            "lua"
            "make"
            "markdown"
            "markdown_inline"
            "nix"
            "norg"
            "pip_requirements"
            "python"
            "regex"
            "rust"
            "solidity"
            "sql"
            "terraform"
            "toml"
            "typescript"
            "vim"
            "yaml"
            "zig"
          ];
          indent = true;
        };
        neorg = {
          enable = true;
          modules = {
            "core.defaults" = {
              __empty = null;
            };
            "core.dirman" = {
            config = {
                workspaces = {
                    work = "~/notes/work";
                    home = "~/notes/home";
                };
            };
          };
          };
        };
        nvim-cmp = {
          enable = true;
          sources = [
            { name = "buffer"; }
            { name = "path"; }
            { name = "nvim-lsp"; }
            { name = "zsh"; }
            { name = "npm"; }
            { name = "crates"; }
            { name = "treesitter"; }
          ];
        };
        #nvim-ufo = {
        #enable = true;
        #};
      };

      extraPlugins = with pkgs.vimPlugins; [
        nvim-hlslens
      ];

      extraConfigLua = ''
        require("hlslens").setup {
          calm_down = true
        }
      '';
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

        local hacktober = wezterm.color.get_builtin_schemes()['Hacktober']
        wezterm.log_info(hacktober)
        hacktober.brights[1] = '#52524F'
        hacktober.selection_bg = '#7B359A'
        config.color_schemes = {
          ['HacktoberHack'] = hacktober,
        }
        config.color_scheme = 'HacktoberHack'


        config.bold_brightens_ansi_colors = "No"
        config.hide_mouse_cursor_when_typing = true
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

    doom-emacs = {
      enable = true;
      doomPrivateDir = ./doom.d;
    };
  };
}
