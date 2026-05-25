{
  programs.wofi = {
    enable = true;
    style = ''
    
    /* Modern Catppuccin-inspired Wofi Theme */
@define-color crust #11111b;
@define-color mantle #181825;
@define-color base #1e1e2e;
@define-color surface0 #313244;
@define-color surface1 #45475a;
@define-color text #cdd6f4;
@define-color subtext0 #a6adc8;
@define-color teal #94e2d5;
@define-color green #a6e3a1;

* {
  font-family: 'MesloLGS Nerd Font', 'Inter', monospace;
  font-size: 16px;
}

/* Window */
window {
  margin: 0px;
  border: 2px solid @surface1;
  border-radius: 16px;
  background-color: @base;
  box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.5);
}

/* Inner Box */
#inner-box {
  margin: 0px;
  border: none;
  background-color: transparent;
}

/* Outer Box */
#outer-box {
  margin: 0px;
  border: none;
  background-color: transparent;
}

/* Scroll */
#scroll {
  margin: 0px 10px 10px 10px;
  border: none;
  background-color: transparent;
}

/* Input */
#input {
  margin: 15px;
  padding: 12px;
  border: 2px solid transparent;
  border-radius: 12px;
  color: @text;
  background-color: @mantle;
  font-weight: bold;
}

#input:focus {
  border: 2px solid @teal;
}

#input image {
    border: none;
    color: @text;
}

/* Text */
#text {
  margin: 5px;
  border: none;
  color: @text;
}

#entry {
  padding: 8px 10px;
  margin: 2px 0px;
  border-radius: 10px;
  background-color: transparent;
  font-weight: normal;
}

#entry arrow {
  border: none;
  color: @subtext0;
}

/* Selected Entry */
#entry:selected {
  background-color: @surface0;
  border: 1px solid @surface1;
}

#entry:selected #text {
  color: @teal;
  font-weight: bold;
}

#entry:drop(active) {
  background-color: @teal!important;
}

    '';
  };
}