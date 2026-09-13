{ config, pkgs, pkgs-unstable, nixpkgs-24-11,... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    [
      nixpkgs-24-11.stremio 
      (let
        pkgs2405 = import (builtins.fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz";
          sha256 = "0zydsqiaz8qi4zd63zsb2gij2p614cgkcaisnk11wjy3nmiq0x1s";
        }) { 
          system = pkgs.system;
          config.allowUnfree = true; 
        };
      in
        pkgs2405.citrix_workspace.overrideAttrs (oldAttrs: rec {
          version = "26.04.0.105";
          src = pkgs.requireFile {
            name = "linuxx64-${version}.tar.gz";
            sha256 = "1aqqi0slms2qyq7qh4zgaj24896s9al1rvy1avsj6clv40v71v5g";
            message = "Using manually downloaded GCC8 tarball";
          };
        })
      )
    ];
}
