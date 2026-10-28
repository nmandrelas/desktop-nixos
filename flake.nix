{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
    packages.${system}.default = nixvim.legacyPackages.${system}.makeNixvim {
        pkgs = import nixpkgs { inherit system; };
        module = ./nixvim.nix;
    };

      # nixos - system hostname
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            hostType = "desktop";
              pkgs-unstable = unstablePkgs;
            inherit inputs system;
          };

          modules = [
            ./configuration.nix
          ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            hostType = "laptop";
              pkgs-unstable = unstablePkgs;
            inherit inputs system;
          };

          modules = [
            ./configuration.nix
          ];
        };

      };

      homeConfigurations = {
        desktop = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = {
            hostType = "desktop";
              pkgs-unstable = unstablePkgs;
          };
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            nixvim.homeModules.nixvim
            ./users/makys/home.nix
          ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = {
            hostType = "laptop";
                pkgs-unstable = unstablePkgs;
          };
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./users/makys/home.nix
          ];
        };
      };
    };
}
