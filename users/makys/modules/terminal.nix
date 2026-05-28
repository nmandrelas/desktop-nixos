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
      shell = "zsh";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      # Delete
      bindkey "^[[3~" delete-char
      # Home
      bindkey "^[[H" beginning-of-line
      bindkey "^[[1~" beginning-of-line
      # End
      bindkey "^[[F" end-of-line
      bindkey "^[[4~" end-of-line
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = ''[\[](bold green)$username[@](bold green)$hostname[:](bold white)$directory[\]](bold green)$git_branch$character'';
      
      username = {
        show_always = true;
        format = ''[$user]($style)'';
        style_user = "bold green";
      };

      hostname = {
        ssh_only = false;
        format = ''[$hostname]($style)'';
        style = "bold green";
      };

      directory = {
        format = ''[$path]($style)'';
        truncation_length = 0;
        truncate_to_repo = false;
        style = "bold blue";
      };

      git_branch = {
        symbol = "#";
        format = ''[$symbol$branch]($style) '';
        style = "bold purple";
      };

      character = {
        success_symbol = ''[\$](bold white) '';
        error_symbol = ''[\$](bold red) '';
      };
    };
  };
}
