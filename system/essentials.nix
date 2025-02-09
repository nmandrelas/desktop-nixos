{ config, pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brave # browser #
    gnome-tweaks
    discord
    gnome-extension-manager # setup gnome essentials #
    spotify # music #
    obsidian # used for note taking #
    piper # UI for  mouse config #
    pavucontrol # Volume control#
    nixfmt # formatter for nix files#
  ];
  services.ratbagd.enable = true; # deamon required for piper #
}
