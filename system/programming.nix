{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vscode # code editor #
    elixir # functional langeuage #
    erlang # beam vm <3 #
    podman # docker alt -> more features #
    postgresql # psql client#
    pgadmin4-desktopmode # postgres sql ui#
    kitty # terminal emulator #
    yazi # terminal file manager #
    git
    gcc
    dotnet-sdk
    neofetch
    gtk3 # Multi-platform toolkit for creating graphical user interfaces
    gtk3-x11
    gsettings-desktop-schemas
    glibc
    libGL
    mesa
    mono
    alsa-lib
    libpulseaudio
    libxkbcommon
    freetype
    libreoffice-qt6-fresh
    ntfs3g #mount drives for read/write#
    wireshark
    iftop #network monitoring#
    nethogs #network monitoring#
    networkmanager
    networkmanagerapplet
    pstree
    zip
    unityhub
  ];
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "code" ''
      exec ${pkgs.vscode}/bin/code "$@"
    '')
  ];

  systemd.coredump.enable = true;
}
