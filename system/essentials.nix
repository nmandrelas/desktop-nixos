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
    nixfmt-classic # formatter for nix files#
    home-manager
    wget
    xfce.thunar # file manager #
    xfce.thunar-archive-plugin   # right-click → extract here
    xfce.thunar-volman           # auto-mount removable devices
  ];
  services = {
    gvfs.enable = true;          # essential for trash, network shares, mounts in Thunar
    tumbler.enable = true;       # thumbnailer for Thunar #
  };
  services.ratbagd.enable = true; # deamon required for piper #
  environment.sessionVariables = {
    BROWSER_PASSWORD_STORE = "basic"; # hyprland + brave
  };
}

