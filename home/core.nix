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
    ripgrep
    jq
    yq-go

    nmap

    glow
    tree
  ];

  programs = {
    bat.enable = true;
    bat.config.theme = "TwoDark";

    fzf.enable = true;
    fzf.enableZshIntegration = true;

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

    alacritty = {
      enable = true;
      settings.font.normal.family = "MesloLGS Nerd Font Mono";
      settings.font.size = 16;
    };

    zoxide = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
