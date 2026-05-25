{ config, pkgs, pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs; [
    pkgs-unstable.elixir-ls
  ];
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };
  systemd.coredump.enable = true;
}
