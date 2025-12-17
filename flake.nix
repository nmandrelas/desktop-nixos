{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-24-11.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-24-11, home-manager, nvf
    , ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      configModule = {
        # Add any custom options (and do feel free to upstream them!)
        # options = { ... };

        config = {
          vim = {
            theme.enable = true;
            theme.name = "gruvbox";
            theme.style = "light";
            # and more options as you see fit...
          };
        };
      };
      customNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [ configModule ];
      };

    in {

      # nixos - system hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
            config.permittedInsecurePackages =
              [ "dotnet-runtime-7.0.20" "electron-33.4.11" "libxml2-2.13.8" ];
          };
          nixpkgs-24-11 = import nixpkgs-24-11 {
            inherit system;
            config.allowUnfree = true;
            config.permittedInsecurePackages =
              [ "dotnet-runtime-7.0.20" "electron-33.4.11" "libxml2-2.13.8" ];
          };
          inherit inputs system;
        };

        modules = [ ./configuration.nix ];
      };

      homeConfigurations.makys = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          { home.packages = [ customNeovim.neovim ]; }
          ./users/makys/home.nix
        ];
      };
    };
}
