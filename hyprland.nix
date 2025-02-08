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
    pkgs.hyprpaper
    #pkgs.rofi-wayland this or wofi
    pkgs.wofi
    pkgs.hyprshot
    pkgs.swaynotificationcenter
    pkgs.hyprlock
    pkgs.stow
    pkgs.starship
    pkgs.fastfetch
    #pkgs.nwg-look
  ];
  # programs.starship.enable = true;
  # programs.starship.settings = {
  #   add_newline = false;
  #   format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
  #   shlvl = {
  #     disabled = false;
  #     symbol = "ﰬ";
  #     style = "bright-red bold";
  #   };
  #   shell = {
  #     disabled = false;
  #     format = "$indicator";
  #     fish_indicator = "";
  #     bash_indicator = "[BASH](bright-white) ";
  #     zsh_indicator = "[ZSH](bright-white) ";
  #   };
  #   username = {
  #     style_user = "bright-white bold";
  #     style_root = "bright-red bold";
  #   };
  #   hostname = {
  #     style = "bright-green bold";
  #     ssh_only = true;
  #   };
  #   nix_shell = {
  #     symbol = "";
  #     format = "[$symbol$name]($style) ";
  #     style = "bright-purple bold";
  #   };
  #   git_branch = {
  #     only_attached = true;
  #     format = "[$symbol$branch]($style) ";
  #     symbol = "שׂ";
  #     style = "bright-yellow bold";
  #   };
  #   git_commit = {
  #     only_detached = true;
  #     format = "[ﰖ$hash]($style) ";
  #     style = "bright-yellow bold";
  #   };
  #   git_state = {
  #     style = "bright-purple bold";
  #   };
  #   git_status = {
  #     style = "bright-green bold";
  #   };
  #   directory = {
  #     read_only = " ";
  #     truncation_length = 0;
  #   };
  #   cmd_duration = {
  #     format = "[$duration]($style) ";
  #     style = "bright-blue";
  #   };
  #   jobs = {
  #     style = "bright-green bold";
  #   };
  #   character = {
  #     success_symbol = "[\\$](bright-green bold)";
  #     error_symbol = "[\\$](bright-red bold)";
  #   };
  # };
}
