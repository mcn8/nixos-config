{ config, lib, nix-homebrew, ... }:

{
  homebrew.enable = true;

  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";

  homebrew.global.brewfile = true;
  homebrew.global.lockfiles = false;

  homebrew.taps = [
    "homebrew/bundle"
    "homebrew/cask"
  ];

  homebrew.brews = [
    "mas"
    "openssl"
  ];

  homebrew.masApps = {
    "CARROT Weather" = 993487541;
    "Cursor Pro" = 1447043133;
    "Keystroke Pro" = 1572206224;
    "MindNode" = 1289197285;
    "Mirror Magnet" = 1563698880;
    "theine" = 955848755; #Caffeine app
    "Parcel" = 639968404;
    # "Xcode" = 497799835;
  };

  homebrew.casks = [
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
    "vlc"
    "zoom"
  ];
}
