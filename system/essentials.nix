{ config, pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  services = {
    gvfs.enable = true;          # essential for trash, network shares, mounts in Thunar
    tumbler.enable = true;       # thumbnailer for Thunar #
  };
  services.ratbagd.enable = true; # deamon required for piper #
  environment.sessionVariables = {
    BROWSER_PASSWORD_STORE = "basic"; # hyprland + brave
  };
}

