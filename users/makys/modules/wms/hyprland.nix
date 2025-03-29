{
  services.hyprpaper={
    enable = true;
    settings = {
      preload =
        [ "~/.config/backgrounds/my_bgs/shaded.png" ];

      wallpaper = [
        "DP-3,~/.config/backgrounds/my_bgs/shaded.png"
        "DP-1,~/.config/backgrounds/my_bgs/shaded.png"
      ];

    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun --allow-images --insensitive";

      monitor = [
        "DP-3, 1920x1080x60.00Hz,0x0, 1"
        "DP-1, 2560x1440@164.96Hz, 1920x0, 1"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,nordzy"
        "ELECTRON_OZONE_PLATFORM_HINT,1"
      ];

      render = {
        explicit_sync = 2;
        explicit_sync_kms = 0;
      };

      opengl = {
        nvidia_anti_flicker = 0;
        force_introspection = 2;
      };

      misc = { vfr = 0; };

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
        damage_tracking = 0;
      };

      input = {
        kb_layout = "us, gr";
        kb_variant = "lang";
        kb_options = "grp:alt_space_toggle";

        follow_mouse = 1;

        touchpad = { natural_scroll = false; };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgba(21B16Bee) rgba(66CDAAee) 45deg";
        "col.inactive_border" = "rgba(11111baa)";
        resize_on_border = true;
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.95;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(11111bee)";
        };

      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      animations = {
        enabled = true;

        # bezier = [
        #   "easeOutQuint,0.23,1,0.32,1"
        #   "easeInOutCubic,0.65,0.05,0.36,1"
        #   "linear,0,0,1,1"
        #   "almostLinear,0.5,0.5,0.75,1.0"
        #   "quick,0.15,0,0.1,1"
        # ];

        # animation = [
        #   "global, 1, 10, default"
        #   "border, 1, 5.39, easeOutQuint"
        #   "windows, 1, 4.79, easeOutQuint"
        #   "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        #   "windowsOut, 1, 1.49, linear, popin 87%"
        #   "fadeIn, 1, 1.73, almostLinear"
        #   "fadeOut, 1, 1.46, almostLinear"
        #   "fade, 1, 3.03, quick"
        #   "layers, 1, 3.81, easeOutQuint"
        #   "layersIn, 1, 4, easeOutQuint, fade"
        #   "layersOut, 1, 1.5, linear, fade"
        #   "fadeLayersIn, 1, 1.79, almostLinear"
        #   "fadeLayersOut, 1, 1.39, almostLinear"
        #   "workspaces, 1, 1.94, almostLinear, fade"
        #   "workspacesIn, 1, 1.21, almostLinear, fade"
        #   "workspacesOut, 1, 1.94, almostLinear, fade"
        # ];

        bezier =[
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      dwindle = {
        pseudotile =
          true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = { new_status = true; };

      gestures = { workspace_swipe = false; };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      windowrule = [ "tile, ^(kitty)$" ];
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      exec-once = [
        "hyprpaper"
        "waybar & swaync"
        "hyprctl setcursor nordzy-latte-green 24"
        "ratbagctl hooting-chinchilla dpi set 8000"
      ];

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Waybar
        "$mainMod, B, exec, pkill -SIGUSR1 waybar"
        "$mainMod, W, exec, pkill -SIGUSR2 waybar"

        # custom
        "$mainMod, SPACE, exec, $menu"
        ", PRINT, exec, hyprshot -m region"
        "SHIFT , PRINT, exec, hyprshot -m window"
        " $SUPER_SHIFT, l, exec, hyprlock"
        "$mainMod, F, fullscreen,"
        "ALT, A, workspace, -1"
        "ALT, D, workspace, +1"
        "ALT SHIFT, A, movetoworkspace, -1"
        "ALT SHIFT, D, movetoworkspace, +1"

      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      workspace = [ "10, border:false, rounding:false" ];
    };
  };
}
