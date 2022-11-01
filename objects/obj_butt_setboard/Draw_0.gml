/// @description
event_inherited()
/*if (obj_solution_manager.show_state_board) {
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(spr_dialog2, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
	gpu_set_blendmode(bm_normal)
}*/
var t = "Toggle State Board (B)"
var c = (obj_solution_manager.show_state_board) ? c_yellow : c_white
draw_text_transformed_color(x,y,t, 0.8,0.8,0, c,c,c,c, 1)

if (hover) show_tooltip("When on, you can draw on board to simulate board of this state", c_black)


