{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    mangohud # A Vulkan and OpenGL overlay for monitoring FPS#
    protonup-qt # Install and manage Proton-GE for Steam and Wine-GE for Lutris with this graphical user interface#
    lutris # Lutris is a video game preservation platform#
    bottles # Bottles introduces a new way to handle Windows prefixes using environments#
    heroic # heroic games launcher#
    prismlauncher # used to manage minecraft#
    dotnet-sdk_7
  ];
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };
  permittedInsecurePackages = [
                "dotnet-sdk-7.0.410"
              ];
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_7}/share/dotnet";
  };

  programs.gamemode.enable = true;
}
