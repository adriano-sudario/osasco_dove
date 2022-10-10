/// @function array_find(array, assertion, send_back_object)

function array_find(_array, _assertion, _send_back_object = undefined){
	var item = noone;
	
	for (var i = 0; i < array_length(_array); i++) {
		var has_found = _assertion(_array[i], _send_back_object);
		if (has_found) {
			item = _array[i];
			break;
		}
	}
		
	return item;
}