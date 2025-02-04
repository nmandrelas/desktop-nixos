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
  ];
  # TODO: Configure starship correctly
  # programs.starship = {
  #   enable = true;
  #   settings = {
  #     add_newline = true;
  #     command_timeout = 1000;
  #     format = "$username";
  #     character = {
  #       success_symbol = "[󰜃 ](bright-cyan)";
  #       error_symbol = "[](red)";
  #     };
  #     username = {
  #       style_user = "white";
  #       style_root = "white";
  #       format = "[$user]($style) ";
  #       disabled = false;
  #       show_always = true;
  #     };
  #     hostname = {
  #       ssh_only = false;
  #       format = "@ [$hostname](bold yellow) ";
  #       disabled = false;
  #     };
  #     directory = {
  #       home_symbol = "󰋞 ~";
  #       read_only_style = "197";
  #       read_only = "  ";
  #       format = "at [$path]($style)[$read_only]($read_only_style) ";
  #     };
  #     git_branch = {
  #       symbol = " ";
  #       format = "via [$symbol$branch]($style) ";
  #       style = "bold green";
  #     };
  #     git_status = {
  #       format = "[\($all_status$ahead_behind\)]($style) ";
  #       style = "bold green";
  #       conflicted = "🏳";
  #       up_to_date = " ";
  #       untracked = " ";
  #       ahead = "⇡\${count}";
  #       diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
  #       behind = "⇣\${count}";
  #       stashed = " ";
  #       modified = " ";
  #       staged = "[++\($count\)](green)";
  #       renamed = "襁 ";
  #       deleted = " ";
  #     };
  #   };
  # };
}