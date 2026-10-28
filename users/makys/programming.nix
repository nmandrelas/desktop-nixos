{ config, pkgs, pkgs-unstable, ... }: {
  home.packages = with pkgs; [
    pkgs-unstable.antigravity-ide
    yazi
    zip
    pstree
    iftop
    nethogs
    networkmanagerapplet
    blueman
  ];
}
