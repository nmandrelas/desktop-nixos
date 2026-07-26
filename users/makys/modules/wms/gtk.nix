{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
    };
    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic-darker";
    };
  };
}
