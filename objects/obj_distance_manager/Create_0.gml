description = "DISTANCE";
font = fnt_monogram_medium;
margin_y = 5;
margin_x = 100;
draw_set_font(font);
description_height = string_height(description);
description_width = string_width(description);
x = obj_poop_button.x - obj_poop_button.sprite_xoffset - margin_x - (description_width * .5);
y = obj_poop_button.y - (description_height * .5) - (margin_y *.5);