{ pkgs, pkgs-unstable, ... }: {
  home.packages = [
    pkgs-unstable.vintagestory
    pkgs.mangohud # A Vulkan and OpenGL overlay for monitoring FPS#
    pkgs.protonup-qt # Install and manage Proton-GE for Steam and Wine-GE for Lutris with this graphical user interface#
    pkgs-unstable.lutris # Lutris is a video game preservation platform#
    #bottles # Bottles introduces a new way to handle Windows prefixes using environments#
    pkgs-unstable.heroic # heroic games launcher#
    pkgs-unstable.prismlauncher # used to manage minecraft#
    (cataclysm-dda.withMods (mods: 
    let
      # 1. Define your custom soundpack
      atsSoundpack = pkgs.cataclysmDDA.buildSoundPack rec {
        modName = "ats-soundpack";
        version = "master"; # Or use a specific date/version number
        
        src = pkgs.fetchurl {
          # Replace this URL with the direct download link to the soundpack zip
          url = "https://github.com/damalsk/damalsksoundpack/archive/refs/heads/master.zip";
          # You can get the sha256 hash by running this in terminal:
          # nix-prefetch-url https://github.com/damalsk/damalsksoundpack/archive/refs/heads/master.zip
          sha256 = "sha256-PUT_THE_GENERATED_HASH_HERE="; 
        };
        
        # Nix needs to know to use unzip to open the file!
        nativeBuildInputs = [ pkgs.unzip ];
      };

    in with mods; [
      # 2. Add the custom soundpack you just defined
      atsSoundpack
      
      # You can still add standard ones alongside it
      tileset.UndeadPeople
    ]
  ))

  ];
}

