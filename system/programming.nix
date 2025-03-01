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
    # bellow may be used for monogame #
    # ripgrep
    # unzip
    # xclip
    # dotnetCorePackages.dotnet_8.runtime
    # dotnetCorePackages.dotnet_8.sdk
    # wine64Packages.waylandFull
    # p7zip
    # wget
    # mono
    # virtualglLib
    # above may be used for monogame #
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
  ];
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };
  # environment.variables.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
  #   pkgs.freetype
  #   pkgs.libGL
  #   pkgs.pulseaudio
  #   pkgs.xorg.libX11
  #   pkgs.xorg.libXrandr
  #   pkgs.dotnet-sdk
  #   pkgs.gtk3
  #   pkgs.gtk3-x11
  # ];

}
