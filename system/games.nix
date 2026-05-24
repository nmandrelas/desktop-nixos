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
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        unzip
        p7zip # Good to have for other mods
      ];
   };
  };
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
