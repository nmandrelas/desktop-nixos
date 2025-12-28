{ pkgs, pkgs-unstable, ... }: {
  nixpkgs.config.permittedInsecurePackages = [ 
    "dotnet-runtime-7.0.20"
    "electron-33.4.11"
    "libxml2-2.13.8"
  ];
  
  environment.systemPackages = [ 
    pkgs.SDL2
    pkgs.SDL2_ttf
    pkgs.raylib
    pkgs.gnumake
    pkgs.gdb
    pkgs.gimp
    pkgs-unstable.lutris # Lutris is a video game preservation platform#
  ];
}
