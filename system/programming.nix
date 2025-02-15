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
    ripgrep
    unzip
    xclip
    dotnetCorePackages.dotnet_8.runtime
    wine64Packages.waylandFull
    p7zip
    wget
  ];
}
wget -qO- https://monogame.net/downloads/net8_mgfxc_wine_setup.sh | bash
