/// @description Board
#macro GRID_SIZE 84
#macro EMPTY -1
//#macro for_board_size for(var i = 0; i < 8; i++) for(var j = 0; j < 8; j++)
mouse_i = -1
mouse_j = -1
hint_arrow = -1
current_hint_arrow_coords = {}
function board_reset() {
	for(var i = 0; i < 8; i++) for(var j = 0; j < 8; j++) {
		board[i][j] = {"gem" : EMPTY, "power" : 0, "value" : 0}
	}
}

function is_out_of_board(i,j) {
	return (i < 0 || i > 7 || j < 0 || j > 7) || (mouse_x < x || mouse_y < y);
}

board = []
board_reset()

hint_map = ds_map_create()
create_hint_map()

function hint_swap_get_coords(hint_value) {
	if ds_map_exists(hint_map, hint_value) {
		var str = hint_map[? hint_value]
		var i1 = real( string_char_at(str, 3) )
		var j1 = real( string_char_at(str, 6) )
		var i2 = real( string_char_at(str, 9) )
		var j2 = real( string_char_at(str, 12) )
		return {"i1" : i1, "j1" : j1, "i2" : i2, "j2" : j2}
	}
	return -1;
}

