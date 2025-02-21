{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "makys";
  home.homeDirectory = "/home/makys";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # enable fonts
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "MesloLGS Nerd Font Mono" ];
        sansSerif = [ "MesloLGS Nerd Font Mono" ];
        monospace = [ "MesloLGS Nerd Font Mono" ];
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    #pkgs.nerdfonts
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    #(pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.xdg.configHome}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    #"${config.xdg.configHome}/backgrounds".source = dotfiles/backgrounds;
    #"${config.xdg.configHome}/wofi".source = dotfiles/wofi;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # TODO: something is taking forever here
    ".config/backgrounds/my_bgs" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/backgrounds/my_bgs;
      recursive = true;
    };
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/kitty;
      recursive = true;
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/hypr;
      recursive = true;
    };
    ".themes/Material-Black-Blueberry" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/themes/.themes/Material-Black-Blueberry;
      recursive = true;
    };
    ".icons/kora-green-1-7-0" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/themes/.icons/kora-green-1-7-0;
      recursive = true;
    };
    ".icons/nordzy" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/themes/.icons/nordzy;
      recursive = true;
    };
    ".icons/OpenZone_Black_Slim" = {
      source = config.lib.file.mkOutOfStoreSymlink dotfiles/themes/.icons/OpenZone_Black_Slim;
      recursive = true;
    };

    ".local/share/icons/nordzy-frappe-green" = {
      source =
        config.lib.file.mkOutOfStoreSymlink dotfiles/themes/.local/share/icons/nordzy-frappe-green;
      recursive = true;
    };
    ".local/share/icons/nordzy-latte-green" = {
      source =
        config.lib.file.mkOutOfStoreSymlink dotfiles/themes/.local/share/icons/nordzy-latte-green;
      recursive = true;
    };
    ".local/share/icons/nordzy-macchiato-green" = {
      source =
        config.lib.file.mkOutOfStoreSymlink dotfiles/themes/.local/share/icons/nordzy-macchiato-green;
      recursive = true;
    };
    ".local/share/icons/nordzy-mocha-green" = {
      source =
        config.lib.file.mkOutOfStoreSymlink dotfiles/themes/.local/share/icons/nordzy-mocha-green;
      recursive = true;
    };
  };
  programs.git = {
    enable = true;
    userName = "Naoum Mandrelas";
    userEmail = "nmandrelas@gmail.com";
    extraConfig = { init.defaultBranch = "main"; };

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/makys/etc/profile.d/hm-session-vars.sh
  #

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # home.sessionVariables = {
  #   PATH="$HOME/.dotnet/tools:$PATH";
  # };
  imports = [
    ./modules/wms/waybar.nix
    ./modules/wms/wofi.nix

  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
