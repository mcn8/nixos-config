{ pkgs, ... }:

{
  imports = [
    ./homebrew
  ];

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina

  environment = with pkgs; {
    shells = [ bash zsh ];
    loginShell = zsh;
    systemPackages = [ curl wget ripgrep ];
  };

  security.pam.enableSudoTouchIdAuth = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = with pkgs; [
    iosevka
    (nerdfonts.override { fonts = [ "IosevkaTerm" "Meslo" "Hack" "FiraCode" "JetBrainsMono" "CascadiaCode" ]; })
  ];

  system = {
    # Set Git commit hash for darwin-version.
    # configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 4;

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    defaults = {
      LaunchServices.LSQuarantine =
        false; # Don't quarantine untrusted downloaded files
      trackpad.Clicking = true;

      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
      };

      NSGlobalDomain = {
	AppleFontSmoothing = 0;
	AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        ApplePressAndHoldEnabled = false;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
	NSAutomaticCapitalizationEnabled = false;
	NSAutomaticDashSubstitutionEnabled = false;
	NSAutomaticPeriodSubstitutionEnabled = false;
	NSAutomaticQuoteSubstitutionEnabled = false;
	NSAutomaticSpellingCorrectionEnabled = false;
	NSNavPanelExpandedStateForSaveMode = true;
	NSNavPanelExpandedStateForSaveMode2 = true;

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
      };

      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-time-modifier = 0.5;
        expose-animation-duration = 0.5;
        expose-group-by-app = true;
        tilesize = 48;
      };
    };
  };

  users.users.n8.home = "/Users/n8";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
