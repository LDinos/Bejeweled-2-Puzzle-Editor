/// @description
var rot = -current_time / 50
var rot2 = current_time / 10
var alpha = abs(sin(current_time / 650))
var alpha2 = abs(cos(current_time / 650))
var lerp_move = abs(sin(current_time / 150))

draw_self()
for(var i = 0; i < 8; i++) for(var j = 0; j < 8; j++) {
	var _gem = board[i][j][$ "gem"]
	var _power = board[i][j][$ "power"]
	var _value = board[i][j][$ "value"]
	var _x = x + j*GRID_SIZE + GRID_SIZE/2
	var _y = y + i*GRID_SIZE + GRID_SIZE/2
	if (_gem != EMPTY) {
		draw_sprite(spr_gems, _gem, _x, _y)
		if (_power) && (_gem < 7) {
			gpu_set_blendmode(bm_add)
			draw_sprite_ext(spr_power, 0, _x, _y, 0.5, 0.5, rot, c_white, alpha)
			draw_sprite_ext(spr_power, 0, _x, _y, 0.5, 0.5, rot2, c_white, alpha2)
			gpu_set_blendmode(bm_normal)	
		}
		else if (_gem == BOMB) {
			draw_set_font(fnt_bomb)
			var c = c_black
			draw_text_color(_x-2, _y-2, _value, c,c,c,c, 1)
			draw_text_color(_x-2, _y+2,_value, c,c,c,c, 1)
			draw_text_color(_x+2, _y-2, _value, c,c,c,c, 1)
			draw_text_color(_x+2, _y+2, _value, c,c,c,c, 1)
			c = make_color_rgb(205, 253, 77)
			draw_text_color(_x, _y, _value, c,c,c,c, 1)
			draw_set_font(-1)
		}
	}
}

if (hint_arrow != -1) {
	var _yoff = lerp(0, 16, lerp_move)
	var i1 = hint_arrow[$ "i1"]; var i2 = hint_arrow[$ "i2"]
	var j1 = hint_arrow[$ "j1"]; var j2 = hint_arrow[$ "j2"]
	var _x1 = x + j1*GRID_SIZE + GRID_SIZE/2
	var _y1 = y + i1*GRID_SIZE + GRID_SIZE/2
	var _x2 = x + j2*GRID_SIZE + GRID_SIZE/2
	var _y2 = y + i2*GRID_SIZE + GRID_SIZE/2
	var a = (obj_solution_manager.set_swap_mode > 0) ? 0.3 : 1
	//1
	draw_sprite_ext(spr_arrow, 0, _x1, _y1 + _yoff, 1, 1, 0, c_white, a)
	//2
	draw_sprite_ext(spr_arrow, 1, _x2, _y2 + _yoff, 1, 1, 0, c_white, a)
}

if (obj_solution_manager.set_swap_mode > 0) {
	if (obj_solution_manager.set_swap_mode == 2) { //if first hint has been set, show it
		var _yoff = lerp(0, 16, 1-lerp_move)
		var i = current_hint_arrow_coords[$ "i1"]
		var j = current_hint_arrow_coords[$ "j1"]
		var _x = x + j*GRID_SIZE + GRID_SIZE/2
		var _y = y + i*GRID_SIZE + GRID_SIZE/2
		draw_sprite(spr_arrow, 0, _x, _y + _yoff)
	}
	if !is_out_of_board(mouse_i,mouse_j) {
		var _yoff = lerp(0, 16, lerp_move)
		var _x = x + mouse_j*GRID_SIZE + GRID_SIZE/2
		var _y = y + mouse_i*GRID_SIZE + GRID_SIZE/2
		draw_sprite(spr_arrow, obj_solution_manager.set_swap_mode-1, _x, _y + _yoff)
	}
}