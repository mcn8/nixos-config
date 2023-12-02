{ config, lib, nix-homebrew, ... }:

{
  nix-homebrew.enable = true;
  nix-homebrew.user = "n8";

  nix-homebrew.onActivation.autoUpdate = true;
  nix-homebrew.onActivation.cleanup = "zap";

  nix-homebrew.global.brewfile = true;
  nix-homebrew.global.lockfiles = false;

  nix-homebrew.mutableTaps = false;

  nix-homebrew.taps = [
    "homebrew/bundle"

    "homebrew/cask"
    "homebrew/cask-versions"
  ];

  nix-homebrew.brews = [
    "mackup"
    "mas"
    "openssl"
  ];

  nix-homebrew.masApps = {
    "CARROT Weather" = 993487541;
    "Cursor Pro" = 1447043133;
    "Keystroke Pro" = 1572206224;
    "MindNode" = 1289197285;
    "Mirror Magnet" = 1563698880;
    "theine" = 955848755; #Caffeine app
    "Parcel" = 639968404;
    # "Xcode" = 497799835;
  };

  nix-homebrew.casks = [
    "1password"
    "1password-cli"
    "alfred"
    "bettertouchtool"
    "brave-browser"
    "charles"
    "cleanshot"
    "cloudflare-warp"
    "codewhisperer"
    "daisydisk"
    "dash"
    "discord"
    "docker"
    "dropshare"
    "figma"
    "firefox"
    "gifox"
    "insomnia"
    "little-snitch"
    "mullvad-browser"
    "mullvadvpn"
    "numi"
    "obsidian"
    "shottr"
    "signal"
    "slack"
    "spotify"
    "telegram"
    "visual-studio-code"
    "vivaldi"
    "zoom"
  ];
}
