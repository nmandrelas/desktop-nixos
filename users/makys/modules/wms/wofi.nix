{
  programs.wofi = {
    enable = true;
    style = ''
    
    /* Hello from wofi again*/
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
@define-color	text  #green;

* {
  font-family: 'MesloLGS Nerd Font', monospace;
  font-size: 18px;
}

/* Window */
window {
  margin: 0px;
  padding: 10px;
  border: 2px solid @lime-green;
  border-radius: 8px;
  background-color: @crust;
}

/* Inner Box */
#inner-box {
  margin: 5px;
  padding: 10px;
  border: none;
  background-color: @crust;
}

/* Outer Box */
#outer-box {
  margin: 5px;
  padding: 10px;
  border: none;
  background-color: @crust;
}

/* Scroll */
#scroll {
  margin: 0px;
  padding: 10px;
  border: none;
  background-color: @crust;
}

/* Input */
#input {
  margin: 5px 20px;
  padding: 10px;
  border: none;
  border-radius: 0.1em;
  color: @lime-green;
  background-color: @crust;
  font-weight: bold;
}

#input image {
    border: none;
    color: @lime-green;
}

#input * {
  outline: 4px solid @lime-green!important;
}

/* Text */
#text {
  margin: 5px;
  border: none;
  color: @text;
}

#entry {
  background-color: @crust;
  font-weight: bold;
}

#entry arrow {
  border: none;
  color: @lime-green;
}

/* Selected Entry */
#entry:selected {
  border: 0.11em solid @teal;
}

#entry:selected #text {
  color: @lime-green;
}

#entry:drop(active) {
  background-color: @lime-green!important;
}

    '';
  }
};