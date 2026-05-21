{ config, pkgs, pkgs-unstable, nixpkgs-24-11,... }: {
  environment.systemPackages =
    [
      pkgs-unstable.epson_201207w 
      pkgs-unstable.epsonscan2 
    ];

  # Enable CUPS printing
  services.printing = {
    enable = true;
    browsed.enable = false;
    drivers = with pkgs; [
      epson-escpr          # Main driver for many Epson inkjets (including L32xx series)
      epson-escpr2         # Newer AirPrint/ESC/P-R2 support (recommended to include both)
    ];
    browsing = true;       # Optional: discover network printers
  };

  # For Wi-Fi discovery and mDNS (very important for wireless Epson printers)
  services.avahi = {
    enable = true;
    nssmdns4 = true;        # .local resolution
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      userServices = true;
    };
  };

  # Optional but recommended: allow printing from other devices on the network
  services.printing.defaultShared = false;  # Set true if you want to share the printer
}
