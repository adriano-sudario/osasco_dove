draw_set_font(font);

if (obj_game.has_ended)
	draw_text_transformed(x, y - 60, "YOU MADE " + get_total_description() + " POINTS!",
		image_xscale, image_yscale, image_angle);
else
	draw_text(x, y, get_total_description());