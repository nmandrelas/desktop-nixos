{ pkgs, pkgs-unstable, ... }: {
  home.packages = [
    pkgs-unstable.vintagestory
    pkgs.mangohud # A Vulkan and OpenGL overlay for monitoring FPS#
    pkgs.protonup-qt # Install and manage Proton-GE for Steam and Wine-GE for Lutris with this graphical user interface#
    pkgs-unstable.lutris # Lutris is a video game preservation platform#
    #bottles # Bottles introduces a new way to handle Windows prefixes using environments#
    pkgs-unstable.heroic # heroic games launcher#
    pkgs-unstable.prismlauncher # used to manage minecraft#
  ];
}