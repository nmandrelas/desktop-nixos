{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    mangohud # A Vulkan and OpenGL overlay for monitoring FPS#
    protonup-qt # Install and manage Proton-GE for Steam and Wine-GE for Lutris with this graphical user interface#
    #lutris # Lutris is a video game preservation platform#
    #bottles # Bottles introduces a new way to handle Windows prefixes using environments#
    heroic # heroic games launcher#
    prismlauncher # used to manage minecraft#
  ];
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
}
