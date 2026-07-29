{ config, pkgs, pkgs-unstable, nixpkgs-24-11,... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    [
      nixpkgs-24-11.citrix_workspace # the devil#
      nixpkgs-24-11.stremio 
      (pkgs-unstable.citrix_workspace.overrideAttrs (oldAttrs: {
        src = pkgs.requireFile {
          name = "linuxx64-26.04.0.105.tar.gz";
          sha256 = "1aqqi0slms2qyq7qh4zgaj24896s9al1rvy1avsj6clv40v71v5g";
          message = "";
        };
      }))
    ];
}
