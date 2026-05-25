{ pkgs, ... }: {
  home.packages = [
    pkgs.hyprpaper
    pkgs.btop
    pkgs.htop
    pkgs.jq

    (pkgs.writeShellScriptBin "audio-switcher" ''
      action=$1
      if [ "$action" = "sink" ]; then
        devices=$(wpctl status | awk '/Sinks:/{f=1;next} /Sources:/{f=0} f' | grep -E "[0-9]+\." | sed -E -e 's/.*│ *\* *([0-9]+)\. (.*) \[vol:.*/\1: 🟢 \2/' -e 's/.*│ *([0-9]+)\. (.*) \[vol:.*/\1: \2/')
        prompt="Select Output Device"
      elif [ "$action" = "source" ]; then
        devices=$(wpctl status | awk '/Video/{exit} /Sources:/{f=1;next} /Filters:/{f=0} f' | grep -E "[0-9]+\." | sed -E -e 's/.*│ *\* *([0-9]+)\. (.*) \[vol:.*/\1: 🟢 \2/' -e 's/.*│ *([0-9]+)\. (.*) \[vol:.*/\1: \2/')
        prompt="Select Input Device"
      else
        exit 1
      fi

      chosen=$(echo "$devices" | wofi --dmenu --prompt "$prompt" --lines 5)
      if [ -n "$chosen" ]; then
        id=$(echo "$chosen" | awk '{print $1}' | tr -d ':')
        wpctl set-default "$id"
      fi
    '')

    (pkgs.writeShellScriptBin "lang-switcher" ''
      hyprctl devices -j | jq -r '.keyboards[] | .name' | head -n1 | xargs -I {} hyprctl switchxkblayout {} next
    '')
  ];
}
