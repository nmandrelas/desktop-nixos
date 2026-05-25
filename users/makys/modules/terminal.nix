{
  programs.kitty = {
    enable = true;
    font = {
      size= 14;
      name= "MesloLGSNerdFontMono";
    };
    themeFile = "Catppuccin-Mocha";
    settings = {
      background_opacity = 1;
      window_padding_width = 10;
      scrollback_lines = 10000;
      update_check_interval = 0;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      git_branch = {
        symbol = "🌱 ";
      };
    };
  };
}
