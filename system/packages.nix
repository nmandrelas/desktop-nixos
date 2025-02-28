{ pkgs, pkgs-unstable, ... }: {
  nixpkgs.config.permittedInsecurePackages = [ "dotnet-runtime-7.0.20" ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerdfonts
    corefonts
    vistafonts
  ];

  environment.systemPackages = [ 
    pkgs-unstable.vintagestory 
    pkgs.icewm
    pkgs.SDL2
    pkgs.SDL2_ttf
    pkgs.raylib
    pkgs.gnumake
  ];
}
