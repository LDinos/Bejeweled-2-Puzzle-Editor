/// @description
var x_start = x - GRID_SIZE/4
var x_end = x + (GRID_SIZE/4) + (image_number-1)*(GRID_SIZE/2)
var y_start = y - GRID_SIZE/4
var y_end = y + GRID_SIZE/4
if (mouse_x > x_start && mouse_x < x_end && mouse_y > y_start && mouse_y < y_end) {
	var i = (mouse_x - x_start) div (GRID_SIZE/2)
	if mouse_check_button_pressed(mb_left) {
		obj_gem_control.gem = i
		instance_destroy()
	}
}





