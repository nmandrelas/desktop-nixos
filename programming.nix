{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        vscode # code editor #
        elixir # functional langeuage #
        erlang # beam vm <3 #
        podman # docker alt -> more features #
        postgresql #psql client#
        pgadmin4-desktopmode #postgres sql ui# 
        kitty # terminal emulator #
        yazi # terminal file manager #
        git 
        gcc
    ];
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };    
}