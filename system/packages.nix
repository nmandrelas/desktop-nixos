{ pkgs, pkgs-unstable, ... }: {
    nixpkgs.config.permittedInsecurePackages = [
      "dotnet-runtime-7.0.20"
    ];
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
  environment.systemPackages = with pkgs-unstable; [
    vintagestory
  ];
}
