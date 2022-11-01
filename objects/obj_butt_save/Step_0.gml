/// @description
if mouse_check_pressed_onme(mb_left) || keyboard_check_pressed(ord("S")) {
	var path = get_save_filename_ext(".bpz Puzzle file|*.bpz", "test", "", "Save your puzzle")
	save_puzzle(path)
}





