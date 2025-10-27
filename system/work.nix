{ config, pkgs, pkgs-unstable, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    [
      pkgs-unstable.citrix_workspace # the devil#
    ];
}
