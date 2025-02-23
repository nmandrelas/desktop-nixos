{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux";
    in {

    # nixos - system hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };

      modules = [
        ./configuration.nix
      ];
    };

    homeConfigurations.makys = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./users/makys/home.nix ];
    };
  };
}
