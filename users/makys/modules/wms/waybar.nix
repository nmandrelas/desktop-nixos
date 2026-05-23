{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 4;
        margin-bottom = 4;
        margin-left = 0;
        margin-right = 16;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
          "hyprland/window"
        ];
        modules-center = [];
        modules-right = [
          "temperature"
          "memory"
          "cpu"
          "network"
          "battery"
          "pulseaudio"
          "pulseaudio#microphone"
          "hyprland/language"
          "tray"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-scroll-up   = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "hyprland/window" = {
          max-length = 60;
          separate-outputs = true;
        };

        "temperature" = {
          critical-threshold = 80;
          format = "󰔏 {temperatureC}°C";
          tooltip = false;
        };

        "clock" = {
          format         = "  {:%a %d %b   %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "network" = {
          format-wifi        = "  {essid}";
          format-ethernet    = "󰈀  {ifname}";
          format-linked      = "  {ifname} (No IP)";
          format-disconnected = "󰤭  Disconnected";
          tooltip-format-wifi = "Signal: {signalStrength}%\n↑ {bandwidthUpBits}  ↓ {bandwidthDownBits}";
          interval   = 1;
          on-click   = "kitty -e nmtui";
        };

        "battery" = {
          states = {
            warning  = 30;
            critical = 15;
          };
          format          = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged  = "  {capacity}%";
          format-full     = "  Full";
          format-icons    = [ "" "" "" "" "" ];
        };

        "cpu" = {
          format   = "󰍛  {usage}%";
          interval = 2;
          on-click = "kitty -e htop";
        };

        "memory" = {
          format         = "󰍛 {percentage}%";
          tooltip-format = "{used:0.1f} GiB / {total:0.1f} GiB";
          on-click       = "kitty -e htop";
        };

        "hyprland/language" = {
          format     = "󰌌  {short}";
          min-length = 6;
        };

        "tray" = {
          icon-size = 18;
          spacing   = 8;
        };

        # ── Speakers ──────────────────────────────────────────────────────
        "pulseaudio" = {
          format           = "{icon}  {volume}%";
          format-bluetooth = "󰂰  {volume}%";
          format-bluetooth-muted = "󰂲";
          format-muted     = "󰝟  muted";
          format-icons = {
            headphone  = "󰋋";
            hands-free = "󱠰";
            headset    = "󰋎";
            phone      = "󰏲";
            portable   = "󰏲";
            car        = "󰄋";
            default    = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click       = "pavucontrol";
          on-click-right = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-scroll-up   = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
        };

        # ── Microphone ────────────────────────────────────────────────────
        "pulseaudio#microphone" = {
          format               = "{format_source}";
          format-source        = "󰍬  {volume}%";
          format-source-muted  = "󰍭  muted";
          on-click       = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          on-scroll-up   = "pactl set-source-volume @DEFAULT_SOURCE@ +5%";
          on-scroll-down = "pactl set-source-volume @DEFAULT_SOURCE@ -5%";
        };

      };
    };

    style = ''
      /* ================================================================
         Color Palette
      ================================================================ */
      @define-color lime-green   #21B16B;
      @define-color medium-aqua  #66CDAA;
      @define-color green        #137B55;
      @define-color dark-green   #184D3E;
      @define-color teal         #18393D;
      @define-color crust        #11111b;
      @define-color text-muted   rgba(127, 132, 156, 0.85);
      @define-color module-bg    rgba(24, 57, 61, 0.40);
      @define-color danger       #f38ba8;
      @define-color warning-col  #f9e2af;

      /* ================================================================
         Base Reset
      ================================================================ */
      * {
        font-family: "MesloLGS Nerd Font", "Font Awesome 6 Free", sans-serif;
        font-size: 13px;
        font-weight: 600;
        min-height: 0;
        border: none;
        border-radius: 0;
        padding: 0;
        margin: 0;
      }

      /* ================================================================
         Bar — Floating Pill
      ================================================================ */
      window#waybar {
        background: rgba(17, 17, 27, 0.88);
        border-radius: 16px;
        border: 1px solid rgba(33, 177, 107, 0.22);
        box-shadow:
          0 4px 32px rgba(0, 0, 0, 0.55),
          0 0 0 1px rgba(33, 177, 107, 0.06) inset;
        color: @lime-green;
        transition: background 0.3s ease;
      }

      /* ================================================================
         Section padding
      ================================================================ */
      .modules-left,
      .modules-right {
        padding: 0 4px;
      }

      .modules-center {
        padding: 0;
      }

      /* ================================================================
         Workspaces
      ================================================================ */
      #workspaces {
        background: rgba(24, 57, 61, 0.28);
        border-radius: 12px;
        margin: 3px 4px 3px 8px;
        padding: 0 4px;
      }

      #workspaces button {
        color: @text-muted;
        background: transparent;
        border-radius: 8px;
        padding: 3px 9px;
        margin: 2px 2px;
        min-width: 28px;
        transition: all 0.2s ease;
      }

      #workspaces button:hover {
        color: @medium-aqua;
        background: rgba(102, 205, 170, 0.10);
      }

      #workspaces button.active {
        color: #11111b;
        background: linear-gradient(135deg, @lime-green 0%, @medium-aqua 100%);
        border-radius: 8px;
        box-shadow: 0 0 14px rgba(33, 177, 107, 0.45);
        font-weight: bold;
      }

      #workspaces button.urgent {
        color: @danger;
        background: rgba(243, 139, 168, 0.18);
        animation: pulse-urgent 1.2s ease infinite alternate;
      }

      @keyframes pulse-urgent {
        from { box-shadow: 0 0 4px rgba(243, 139, 168, 0.3); }
        to   { box-shadow: 0 0 12px rgba(243, 139, 168, 0.7); }
      }

      /* ================================================================
         Window Title
      ================================================================ */
      #window {
        color: rgba(180, 215, 195, 0.65);
        font-size: 12px;
        font-weight: 400;
        margin: 3px 4px;
        padding: 0 10px;
        border-radius: 8px;
      }

      /* ================================================================
         Submap badge
      ================================================================ */
      #submap {
        color: @warning-col;
        background: rgba(249, 226, 175, 0.12);
        border-radius: 8px;
        padding: 3px 10px;
        margin: 5px 4px;
        font-size: 11px;
      }

      /* ================================================================
         Clock (center)
      ================================================================ */
      #clock {
        color: @lime-green;
        background: rgba(33, 177, 107, 0.13);
        border-radius: 14px;
        padding: 4px 16px;
        margin: 3px 8px 3px 3px;
        font-weight: bold;
        letter-spacing: 0.4px;
        text-shadow: 0 0 10px rgba(33, 177, 107, 0.35);
        transition: all 0.25s ease;
      }

      #clock:hover {
        background: rgba(33, 177, 107, 0.20);
        box-shadow: 0 0 12px rgba(33, 177, 107, 0.25);
      }

      /* ================================================================
         Right-side modules — shared capsule style
      ================================================================ */
      #temperature,
      #memory,
      #cpu,
      #network,
      #battery,
      #pulseaudio,
      #pulseaudio.microphone,
      #language,
      #tray {
        background: @module-bg;
        border-radius: 10px;
        color: @lime-green;
        padding: 4px 10px;
        margin: 3px 3px;
        transition: all 0.22s ease;
      }

      #temperature:hover,
      #memory:hover,
      #cpu:hover,
      #network:hover,
      #battery:hover,
      #pulseaudio:hover,
      #language:hover {
        background: rgba(24, 57, 61, 0.62);
        color: @medium-aqua;
        box-shadow: 0 0 10px rgba(33, 177, 107, 0.18);
      }

      /* ================================================================
         Per-module accent colors
      ================================================================ */
      #cpu,
      #memory,
      #temperature {
        color: @medium-aqua;
      }

      /* Network */
      #network {
        color: @lime-green;
      }

      #network.disconnected {
        color: @danger;
        background: rgba(243, 139, 168, 0.10);
      }

      /* Battery */
      #battery.warning:not(.charging) {
        color: @warning-col;
        background: rgba(249, 226, 175, 0.10);
      }

      #battery.critical:not(.charging) {
        color: @danger;
        background: rgba(243, 139, 168, 0.12);
        animation: battery-blink 1s steps(1) infinite;
      }

      @keyframes battery-blink {
        50% { opacity: 0.45; }
      }

      /* Temperature critical */
      #temperature.critical {
        color: @danger;
        background: rgba(243, 139, 168, 0.14);
        box-shadow: 0 0 10px rgba(243, 139, 168, 0.28);
      }

      /* Pulseaudio — speakers */
      #pulseaudio.muted {
        color: @text-muted;
        background: rgba(127, 132, 156, 0.10);
      }

      /* Pulseaudio — microphone */
      #pulseaudio.microphone {
        color: @medium-aqua;
      }

      #pulseaudio.microphone.muted {
        color: @text-muted;
        background: rgba(127, 132, 156, 0.10);
      }

      /* Language */
      #language {
        font-size: 12px;
      }

      /* ================================================================
         Tray
      ================================================================ */
      #tray {
        padding: 4px 10px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background: rgba(249, 226, 175, 0.14);
        border-radius: 8px;
      }

      /* ================================================================
         Tooltip
      ================================================================ */
      tooltip {
        background: rgba(17, 17, 27, 0.96);
        border: 1px solid rgba(33, 177, 107, 0.28);
        border-radius: 10px;
      }

      tooltip label {
        color: @lime-green;
        padding: 4px 10px;
      }
    '';
  };
}
