{
  programs.wofi = {
    enable = true;
    style = ''
    
    /* Matching Environment Wofi Theme */
@define-color accent #21B16B;
@define-color bg #11111b;
@define-color input-border #1E575E;
@define-color text #cdd6f4;
@define-color text-sel #11111b;
@define-color subtext #a6adc8;

* {
  font-family: 'MesloLGS Nerd Font', 'Inter', monospace;
  font-size: 16px;
}

/* Window */
window {
  margin: 0px;
  border: 2px solid @accent;
  border-radius: 12px;
  background-color: @bg;
}

/* Inner Box */
#inner-box {
  margin: 10px;
  border: none;
  background-color: transparent;
}

/* Outer Box */
#outer-box {
  margin: 10px;
  border: none;
  background-color: transparent;
}

/* Scroll */
#scroll {
  margin: 10px 0px 0px 0px;
  border: none;
  background-color: transparent;
}

/* Input */
#input {
  margin: 0px;
  padding: 10px;
  border: 2px solid @input-border;
  border-radius: 8px;
  color: @text;
  background-color: transparent;
  font-weight: bold;
}

#input:focus {
  border: 2px solid @accent;
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
  border-radius: 8px;
  background-color: transparent;
  font-weight: normal;
}

#entry arrow {
  border: none;
  color: @subtext;
}

/* Selected Entry */
#entry:selected {
  background-color: @accent;
  border: none;
}

#entry:selected #text {
  color: @text-sel;
  font-weight: bold;
}

#entry:drop(active) {
  background-color: @accent!important;
}

    '';
  };
}