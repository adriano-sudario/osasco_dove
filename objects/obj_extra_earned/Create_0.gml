font = fnt_monogram_medium;
milliseconds = 500;
callback = function() {
	var _disappear = function() {
		tweening(TWEEN_MODE.ONE_SHOT, TWEEN_MODIFIER.SIZE, 0, milliseconds,
			{
				ease_function: in_back
			}
		);
	}
	call_later(.5, time_source_units_seconds, _disappear);
};
points = 0;
image_xscale = 0;
image_yscale = 0;

tweening(TWEEN_MODE.PERSIST, TWEEN_MODIFIER.SIZE, 1, milliseconds,
	{
		on_finish: callback,
		ease_function: out_back
	}
);