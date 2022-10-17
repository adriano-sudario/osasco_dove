draw_set_color(c_black);
draw_set_font(font);
draw_set_halign(fa_center);
draw_text_transformed(x, y, "+" + string(round(points)), image_xscale, image_yscale, image_angle);
draw_set_color(c_white);