/// @description
mouse_i = (mouse_y - y) div GRID_SIZE //row
mouse_j = (mouse_x - x) div GRID_SIZE //column

var l = array_length(obj_butt_state.states_array)
var _board = obj_solution_manager.show_state_board ? state_board[obj_butt_state.state_index] : board 

if !is_out_of_board(mouse_i, mouse_j) {
	var i = mouse_i
	var j = mouse_j
	
	if (mouse_check_button_pressed(mb_left) && obj_solution_manager.set_swap_mode > 0) {
		var n = obj_solution_manager.set_swap_mode
		current_hint_arrow_coords[$ "i"+string(n)] = i
		current_hint_arrow_coords[$ "j"+string(n)] = j
		if (n == 2) {
			obj_solution_manager.add_new_hint(current_hint_arrow_coords)
			mouse_clear(mb_left)
			exit;
		} else {
			obj_solution_manager.set_swap_mode++
			mouse_clear(mb_left)
			exit;
		}
	} else if (obj_solution_manager.set_swap_mode == 0) {
	
		if mouse_check_button(mb_left) {		
			var _gem = obj_gem_control.gem
			var _power = obj_gem_control.gem_power
			var _value = obj_gem_control.gem_value
			if (_board[i][j][$ "gem"] == EMPTY) {
				_board[i][j][$ "gem"] = _gem
				_board[i][j][$ "power"] = _power
				_board[i][j][$ "value"] = _value
			}
		}
		else if mouse_check_button(mb_right) {
			_board[i][j][$ "gem"] = EMPTY
			_board[i][j][$ "power"] = 0
			_board[i][j][$ "value"] = 0
		}
	
		if mouse_wheel_up() {
			if (_board[i][j][$ "gem"] == BOMB) {
				_board[i][j][$ "value"]++
				_board[i][j][$ "value"] = clamp(_board[i][j][$ "value"], 0, 255)
			}
		}
		else if mouse_wheel_down() {
			if (_board[i][j][$ "gem"] == BOMB) {
				_board[i][j][$ "value"]--
				_board[i][j][$ "value"] = clamp(_board[i][j][$ "value"], 0, 255)
			}
		}
	
		if mouse_check_button_pressed(mb_middle) {
			if (_board[i][j][$ "gem"] != EMPTY) && (_board[i][j][$ "gem"] < 7) {
				_board[i][j][$ "power"] = !_board[i][j][$ "power"]
			}
		}
	}
}




