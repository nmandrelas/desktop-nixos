# EVERYTHING YOU NEED TO RUN HYPRLAND
# WIP
{ config, pkgs, ... }:

{
  #Only for hyprland should be moved in user file
  environment.sessionVariables = {
    #If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    #Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
  #hyprland + nvidia patches
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pkgs.waybar
    pkgs.mako
    pkgs.libnotify
    pkgs.swww
    pkgs.wofi
    pkgs.hyprshot
    pkgs.swaynotificationcenter
    pkgs.hyprlock
    pkgs.stow
    pkgs.starship
    pkgs.fastfetch
    pkgs.nwg-look
  ];
}
