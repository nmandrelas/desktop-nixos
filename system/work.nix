{ config, pkgs, pkgs-unstable, nixpkgs-24-11,... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    [
      nixpkgs-24-11.stremio 
      pkgs-unstable.citrix_workspace_26_01_0
    ];
  services.flatpak.enable = true;
}
