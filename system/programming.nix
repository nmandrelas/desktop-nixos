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
    gtk3

  ];
  environment.sessionVariables = { 
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };
}
