font = fnt_monogram_big;
margin_y = 20;
distance = 0;
extra = 0;
draw_set_font(font);
text_height = string_height("STRING");
x = obj_poop_button.x;
y = obj_poop_button.y - obj_poop_button.sprite_yoffset - (text_height * .5) - margin_y;

function get_total_description() {
	with(obj_distance_manager)
		other.distance = distance;
	
	with(obj_extra_manager)
		other.extra = extra;
	
	return string(distance + extra);
}