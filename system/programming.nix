{ config, pkgs, pkgs-unstable, ... }: {
  environment.systemPackages = [ ];
  systemd.coredump.enable = true;
}
