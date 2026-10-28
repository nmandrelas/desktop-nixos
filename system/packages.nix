{ pkgs, pkgs-unstable, ... }: {
  nixpkgs.config.permittedInsecurePackages = [ 
    "dotnet-runtime-7.0.20"
    "electron-33.4.11"
    "libxml2-2.13.8"
  ];
  
  environment.systemPackages = [ 
    pkgs.usbutils
    pkgs.alsa-utils
  ];
}
