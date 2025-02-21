{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = [ "~/.config/backgrounds/my_bgs/nix-wallpaper-binary-green.png" ];

      wallpapers = [
        "DP-1, ~/.config/backgrounds/my_bgs/nix-wallpaper-binary-green.png"
        "DP-3, ~/.config/backgrounds/my_bgs/nix-wallpaper-binary-green.png"
      ];
    };
  };
}
