{ config, pkgs, ... }: {
  # Enable OpenGL
  hardware.graphics = { enable = true; };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
