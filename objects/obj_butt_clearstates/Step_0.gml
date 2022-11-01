/// @description
if mouse_check_pressed_onme(mb_left) {
	var b = show_question("This will delete all states/hints. Are you sure?")
	if (b) {
		obj_path_string.solution_path = ""
		with(obj_butt_state) {
			state_index = -1
			states_array = []
		}
		with(obj_solution_manager) {
			hover = -1
			starting_state = 0
			set_swap_mode = 0 // 0 = no swap mode, 1 = set first swap, 2 = set second swap
			current_hint_newswap = 0 //used to see if we change swap positions or if we make a new hint swap position
			show_state_board = false
			page = 0 //cant fit all hints, make pages
		}		
	}
}





