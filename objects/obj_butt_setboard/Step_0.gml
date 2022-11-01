/// @description
if mouse_check_pressed_onme(mb_left) || keyboard_check_pressed(ord("B")) {
	var l = array_length(obj_butt_state.states_array)
	if (l != 0) obj_solution_manager.show_state_board = !obj_solution_manager.show_state_board
}





