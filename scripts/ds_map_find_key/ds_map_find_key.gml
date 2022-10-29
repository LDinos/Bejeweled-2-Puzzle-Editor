/// @function ds_map_find_key(map, value)
/// @description Returns the key that belongs to the given value or undefined if not found
/// @param {ds_map} param map
/// @param {any} param value
function ds_map_find_key(map, value){
	var names = ds_map_keys_to_array(map);
	var dim = array_length(names)
	for (var i = 0; i < dim; i++) {
	  if (map[? names[i]] == value) {
	    return names[i];
	  }
	}
	return undefined;
}
