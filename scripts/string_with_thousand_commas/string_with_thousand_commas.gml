function string_with_thousand_commas(_value) {
	if (is_numeric(_value))
		_value = string(_value);
	
	for (var i = string_length(_value) - 2; i > 1; i -= 3)
	    _value = string_insert(",", _value, i);
	
	return _value;
}