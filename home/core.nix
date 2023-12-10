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
    bat.config.theme = "TwoDark";

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
      syntaxHighlighting.enable = true;
    };

    git = {
      enable = true;
      userName = "mcn8";
      userEmail = "mccordnate@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "vim";
      };

      delta.enable = true;
    };

    neovim = {
      enable = true;
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
      extraConfig = ''
        local w = require('wezterm')
	local config = w.config_builder()
	config.hide_mouse_cursor_when_typing = true
	config.color_scheme = 'nightfox'
	config.font = w.font('Iosevka')
	config.font_size = 18
	config.font_shaper = "Harfbuzz"
	config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
	config.use_fancy_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = true

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

    };
  };
}
