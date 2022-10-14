draw_set_font(font);
draw_set_halign(fa_left);
draw_text(margin, y, points_description);
draw_set_halign(fa_right);
draw_text(obj_void.bbox_right - margin, y, distance_description);
draw_set_halign(fa_center);