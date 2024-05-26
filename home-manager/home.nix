{ config, pkgs, ... }:

{
  imports = [
    ./modules/bundle.nix
  ];

  # For user specific config and packages.
  home = {
    username = "dudos";
    homeDirectory = "/home/dudos";
    stateVersion = "23.11";
    packages = [
      # pkgs.hello
    ];
    # Home Manager is pretty good at managing dotfiles. The primary way to manage plain files is through 'home.file'.
    file = {};
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
