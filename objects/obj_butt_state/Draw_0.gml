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
		
	show_tooltip("Set this state as starting state", c_black)
}



