font = fnt_monogram_medium;
margin_y = 40;
margin = 40;
best_distance = 0;
best_points = 0;
best_poops_hit = 0;
distance_description = "";
points_description = "";
draw_set_font(font);
text_height = string_height("STRING");
x = display_get_gui_width() * .5;
y = obj_tap_area.bbox_top + margin_y;

function update_descriptions() {
	distance_description = "further: " + get_distance_display(best_distance);
	points_description = "best: " + string(round(best_distance + best_points)) + "pts";
}

function update_record(_distance, _extra_points, _poops_hit_count) {
	var _points = _distance + _extra_points;
	
	if (_points > best_points)
		best_points = _points;
		
	if (_distance > best_distance)
		best_distance = _distance;
		
	if (_poops_hit_count > best_poops_hit)
		best_poops_hit = _poops_hit_count;
		
	update_descriptions();
	save();
}