{ config, pkgs-unstable,pkgs, ... }: {
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    fontPackages = with pkgs; [
      corefonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      liberation_ttf
    ];
  };
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
