{ config, pkgs, pkgs-unstable, nixpkgs-24-11,... }: {
  environment.systemPackages =
    [
      pkgs-unstable.epson_201207w 
      pkgs-unstable.epsonscan2 
    ];
}
