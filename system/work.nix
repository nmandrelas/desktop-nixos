{ config, pkgs, pkgs-unstable, nixpkgs-24-11,... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
  [
    nixpkgs-24-11.citrix_workspace # the devil#
    (nixpkgs-24-11.citrix_workspace.override {})
  ];
}
