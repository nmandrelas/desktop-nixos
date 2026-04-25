{ config, pkgs, pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs; [
    vscode # code editor #
    erlang # beam vm <3 #
    podman # docker alt -> more features #
    postgresql # psql client#
    pgadmin4-desktopmode # postgres sql ui#
    kitty # terminal emulator #
    yazi # terminal file manager #
    git
    gcc
    python3
    gnumake
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
    blueman
    pstree
    zip
    (pkgs.writeShellScriptBin "code" ''
      exec ${pkgs.vscode}/bin/code "$@"
    '')
    pkgs-unstable.elixir-ls
    pkgs-unstable.beamMinimal28Packages.elixir_1_19
    zlib
    icu
    openssl
    nss
    nspr
    jetbrains.idea-oss
    #stable diffusion start
    python310
    python310Packages.pip
    cudatoolkit
    #end
    #dotnet
    dotnet-sdk_10
    # Debugger
    netcoredbg
    # Nice to have
    csharpier          # formatter
    fantomas           # F# formatter (if needed)
    #dotnet end
    go
    claude-code
  ];
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };
  systemd.coredump.enable = true;
}
