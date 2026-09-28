{ config, pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with pkgs; [
    brave # browser #
    gnome-tweaks
    discord
    gnome-extension-manager # setup gnome essentials #
    spotify # music #
    obsidian # used for note taking #
    piper # UI for  mouse config #
    pavucontrol # Volume control#
    nixfmt-rfc-style # formatter for nix files#
    wget
    thunar # file manager #
    thunar-archive-plugin   # right-click → extract here
    thunar-volman           # auto-mount removable devices
    vesktop
    stremio-linux-shell
  ];
}

