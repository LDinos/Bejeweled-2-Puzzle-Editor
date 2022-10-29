/// @description
var text = (state_index == -1) ? "None" : string(state_index+1)

draw_self()
var c = state_index != obj_solution_manager.starting_state ? c_white : c_aqua
var s = state_index != obj_solution_manager.starting_state ? "" : "(Start) "
draw_text_color(x,y, s +"State: " + text, c, c, c, c, 1)

if hover {
	draw_set_alpha(0.2)
	gpu_set_blendmode(bm_add)
	draw_sprite(sprite_index,0, x, y)
	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
	
	var t = "Set this state as starting state"
	var _x = mouse_x + 8
	var _x2 = mouse_x + string_width(t) + 16
	var _y = mouse_y - 8
	var _y2 = mouse_y + 8
	draw_set_halign(fa_left)
	var c = c_black
	draw_rectangle_color(_x,_y,_x2,_y2, c,c,c,c, false)
	draw_text(mouse_x + 12, mouse_y,t)
	draw_set_halign(fa_middle)
}



