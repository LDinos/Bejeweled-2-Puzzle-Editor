/// @description
if mouse_check_pressed_onme(mb_left) {
	var b = show_question("Are you sure you want to clear all the gems from the board?")
	if (b) {
		obj_path_string.puzzle_path = ""
		with(obj_board) board_reset(board)
	}
}





