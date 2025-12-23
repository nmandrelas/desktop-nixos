{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
          "hyprland/submap"
        ];
        modules-center = [ 
          "tray"
        ];
        modules-right =
          [ 
            "temperature"
            "memory"
            "cpu"
            "network"
            "pulseaudio"
            "hyprland/language"
            "clock" 
          ];

        "temperature" = {
            # thermal-zone = 2;
            # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
            critical-threshold = 80;
            # format-critical = "{temperatureC}°C {icon}";
            format = "{icon} {temperatureC}°C";
            format-icons = ["" "" "" "" ""];
            tooltip = false;
        };
        "clock" = {
          "format"= "<span foreground='#21B16B'>{:%a %d %H:%M}</span>";
          "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "min-length"= 14;
        };
        "network" = {
          "format-wifi"= " {bandwidthUpBits:>5} {bandwidthDownBits:>5} <span size='13000' foreground='#18393D'>  </span>{essid}";
          "format-ethernet"= "<span size='13000' foreground='#18393D'>󰤭  </span> Disconnected";
          "format-linked"= "{ifname} (No IP) ";
          "format-disconnected"= "<span size='13000' foreground='#18393D'>  </span>Disconnected";
          "tooltip-format-wifi"= "Signal Strenght: {signalStrength}%";
          "interval"= 1;
          "min-length"= 14;
        };
        "cpu"= {
          "format"= "󰍛　{usage}%";
          "on-click"= "gnome-system-monitor";
        };
        "memory"= {
          "format"= "　{}%";
          "on-click"= "gnome-system-monitor";
        };
        "hyprland/language"= {
          "format"= "󰌌　{short}";
          "min-length"= 6;
        };
        "tray"= {
          "icon-size"= 21;
          "spacing"= 10;
          "min-length"= 32;
        };
        "pulseaudio"= {
          # scroll-step = 1; # %, can be a float
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };

      };
    };

    style = ''
            @define-color lime-green #21B16B;
            @define-color green #137B55;
            @define-color background #121F1B;
            @define-color dark-green #184D3E;
            @define-color yellow-green #B2C689;
            @define-color dark-teal #18393D;
            @define-color light-sea-green #1E575E;
            @define-color sea-green #228B22;
            @define-color teal #379098;
            @define-color brown #5D4B3C;
            @define-color overlay2 #9399b2;
            @define-color overlay1 #7f849c;
            @define-color overlay0 #6c7086;
            @define-color crust #11111b;
            @define-color danger #742C54;
            @define-color medium-aquamarine #66CDAA;
            @define-color olive #808000;

      * {
          font-family: "MesloLGS Nerd Font","Font Awesome 6 Free";
          font-size: 16px;
          min-height: 0;
          font-weight: bold;
      }

      window#waybar {
          background: transparent;
          background-color: @crust;
          color: @lime-green;
          transition-property: background-color;
          transition-duration: 0.1s;
          border-bottom: 3px solid @dark-teal;
      }

      #window {
          margin: 8px 8px 8px 40px;
          padding-left: 8px;
          padding-right: 8px;
      }

      button {
          box-shadow: inset 0 -3px transparent;
          border: none;
          border-radius: 0;
      }

      button:hover {
          background: inherit;
          color: @sea-green;
          border-top: 2px solid @sea-green;
      }

      #workspaces button {
          padding: 0 4px;
      }

      #workspaces button.focused {
          background-color: rgba(0, 0, 0, 0.3);
          color: @sea-green;
          border-top: 2px solid @sea-green;
      }

      #workspaces button.active {
          background-color: rgba(0, 0, 0, 0.3);
          color: @lime-green;
          border-top: 2px solid @lime-green;
      }

      #workspaces button.urgent {
          background-color: @olive;
      }

      #pulseaudio,
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #wireplumber,
      #tray,
      #network,
      #mode,
      #language,
      #scratchpad {
        margin-top: 2px;
        margin-bottom: 2px;
        margin-left: 4px;
        margin-right: 4px;
        padding-left: 4px;
        padding-right: 4px;
      }

      #clock {
          color: @lime-green;
          border-bottom: 2px solid @lime-green;
      }

      #clock.date {
          color: @lime-green;
          border-bottom: 2px solid @lime-green;
      }

      #language{
          color: @lime-green;
          border-bottom: 2px solid @lime-green;
      }

      #pulseaudio {
          color: @lime-green;
          border-bottom: 2px solid @lime-green;
      }
      #cpu,
      #memory{
          color: @sea-green;
          border-bottom: 2px solid @sea-green;
      }
      #network {
          color: @sea-green;
          border-bottom: 2px solid @sea-green;
      }

      #idle_inhibitor {
          margin-right: 12px;
          color: #7cb342;
      }

      #idle_inhibitor.activated {
          color: @red;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left>widget:first-child>#workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right>widget:last-child>#workspaces {
          margin-right: 0;
      }

      #custom-vpn {
          color: @olive;
          border-radius: 15px;
          padding-left: 6px;
          padding-right: 6px;
      }

      #temperature {
        border-bottom: 2px solid @sea-green;
        color: @sea-green;
      }

      #temperature.critical {
          background-color: #eb4d4b;
      }
    '';
  };
}
