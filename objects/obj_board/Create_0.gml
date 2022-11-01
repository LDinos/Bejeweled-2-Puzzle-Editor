/// @description Board
#macro GRID_SIZE 84
#macro EMPTY -1
//#macro for_board_size for(var i = 0; i < 8; i++) for(var j = 0; j < 8; j++)
mouse_i = -1
mouse_j = -1
hint_arrow = -1
current_hint_arrow_coords = {}

function is_out_of_board(i,j) {
	return (i < 0 || i > 7 || j < 0 || j > 7) || (mouse_x < x || mouse_y < y);
}

board = []
state_board = []
board_reset(board)

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

function draw_board(board, rot, rot2, alpha, alpha2, board_alpha) {
	for(var i = 0; i < 8; i++) for(var j = 0; j < 8; j++) {
		var _gem = board[i][j][$ "gem"]
		var _power = board[i][j][$ "power"]
		var _value = board[i][j][$ "value"]
		var _x = x + j*GRID_SIZE + GRID_SIZE/2
		var _y = y + i*GRID_SIZE + GRID_SIZE/2
		if (_gem != EMPTY) {
			draw_sprite_ext(spr_gems, _gem, _x, _y, 1, 1, 0, c_white, board_alpha)
			if (_power) && (_gem < 7) {
				gpu_set_blendmode(bm_add)
				draw_sprite_ext(spr_power, 0, _x, _y, 0.5, 0.5, rot, c_white, alpha*board_alpha)
				draw_sprite_ext(spr_power, 0, _x, _y, 0.5, 0.5, rot2, c_white, alpha2*board_alpha)
				gpu_set_blendmode(bm_normal)	
			}
			else if (_gem == BOMB) {
				draw_set_font(fnt_bomb)
				var c = make_color_rgb(205, 253, 77)
				draw_text_outline(_x, _y, _value, c, 2, c_black, alpha*board_alpha)
				draw_set_font(-1)
			}
		}
	}
}
