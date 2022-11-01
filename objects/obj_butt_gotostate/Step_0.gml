/// @description
if mouse_check_pressed_onme(mb_left) || keyboard_check_pressed(ord("G")) {
	var l = array_length(obj_butt_state.states_array)
	var _id = get_integer(
	"Please type the state you want to be directed into.\n\n" +
	"Starting State: " + string(obj_solution_manager.starting_state+1) + "\n" +
	"Number of States: " + string(l), 0)

	if is_real(_id) {
		if (_id <= l) && (_id > 0) {
			obj_butt_state.state_index = _id - 1
			obj_solution_manager.page = 0
		}
	}
}





