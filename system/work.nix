{ config, pkgs, pkgs-unstable, nixpkgs-24-11,... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    [
      pkgs.citrix_workspace # the devil#
    ];
}
