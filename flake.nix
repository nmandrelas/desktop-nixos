{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-24-11.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-24-11,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      configModule = {
        config = {
          vim = {
            theme.enable = true;
            theme.name = "gruvbox";
            theme.style = "light";
          };
        };
      };
      customNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [ ./users/makys/neovim_config.nix ];
      };

    in
    {

      # nixos - system hostname
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            hostType = "desktop";
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
              config.permittedInsecurePackages = [
                "dotnet-runtime-7.0.20"
                "electron-33.4.11"
                "libxml2-2.13.8"
              ];
            };
            nixpkgs-24-11 = import nixpkgs-24-11 {
              inherit system;
              config.allowUnfree = true;
              config.permittedInsecurePackages = [
                "dotnet-runtime-7.0.20"
                "electron-33.4.11"
                "libxml2-2.13.8"
              ];
            };
            inherit inputs system;
          };

          modules = [
            ./configuration.nix
          ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            hostType = "laptop";
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
              config.permittedInsecurePackages = [
                "dotnet-runtime-7.0.20"
                "electron-33.4.11"
                "libxml2-2.13.8"
              ];
            };
            nixpkgs-24-11 = import nixpkgs-24-11 {
              inherit system;
              config.allowUnfree = true;
              config.permittedInsecurePackages = [
                "dotnet-runtime-7.0.20"
                "electron-33.4.11"
                "libxml2-2.13.8"
              ];
            };
            inherit inputs system;
          };

          modules = [
            ./configuration.nix
          ];
        };

      };

      homeConfigurations = {
        dekstop = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = {
            hostType = "dekstop";
          };
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            { home.packages = [ customNeovim.neovim ]; }
            ./users/makys/home.nix
          ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = {
            hostType = "laptop";
          };
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            { home.packages = [ customNeovim.neovim ]; }
            ./users/makys/home.nix
          ];
        };
      };
    };
}
