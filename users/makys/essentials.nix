{ config, pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with pkgs; [
    brave # browser #
    discord
    spotify # music #
    pavucontrol # Volume control#
    nixfmt-rfc-style # formatter for nix files#
    wget
    thunar # file manager #
    thunar-archive-plugin   # right-click → extract here
    thunar-volman           # auto-mount removable devices
    stremio-linux-shell
  ];
}

