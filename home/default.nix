{ ... }:

let username = "n8";
in {
  imports = [ ./core.nix ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
