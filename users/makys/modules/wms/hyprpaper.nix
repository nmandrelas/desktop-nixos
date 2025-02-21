{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload =
        [ "~/.config/backgrounds/my_bgs/nix-wallpaper-binary-green.png" ];

      wallpapers =
        [ ", ~/.config/backgrounds/my_bgs/nix-wallpaper-binary-green.png" ];
    };
  };
}
