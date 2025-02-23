{
		programs.hyprlock = {
				enable = true;
				settings = {
						path = "screenshot";
						general = {
								grace = 0;
								ignore_empty_input = true;
						};

						background = {
										monitor = "";
										path = "screenshot";
										color = "rgba(25, 20, 20, 1.0)";
										blur_passes = 2;
						};
						input-field = {
										monitor = "";
										size = "30%, 10%";
										outline_thickness = 3;
										inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

										outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
										check_color= "rgba(00ff99ee) rgba(ff6633ee) 120deg";
										fail_color= "rgba(ff6633ee) rgba(ff0066ee) 40deg";

										font_color = "rgb(143, 143, 143)";
										fade_on_empty = false;
										rounding = 15;

										position = "0, -20";
										halign = "center";
										valign = "center";
						};
						# TIME
						label = {
								monitor = "";
								text = "$TIME";
								color = "$text";
								font_size = 90;
								font_family = "$font";
								position = "-30, 0";
								halign = "right";
								valign = "top";
						};
				};
		};
}