draw_set_color(c_black);
draw_set_font(font);
draw_text_transformed(x, y, "+" + string(ceil(points)), image_xscale, image_yscale, image_angle);
draw_set_color(c_white);