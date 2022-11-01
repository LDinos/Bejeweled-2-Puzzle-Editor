/// @function mouse_check_pressed_onme(mb_event)
function mouse_check_pressed_onme(mb){
	if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb) return true;
	return false;
}