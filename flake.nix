{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      default = lib.nixosSystem {
        inherit system;
        modules = [ ./nixos/configuration.nix ];
      };
    };

    homeConfigurations = {
      dudos = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ];
      };

      # Now I can make entirly new configurations for example if I want to test a new WM
      # -> install all the deps end config files in a new configuration
    };
  };
}
