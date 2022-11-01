/// @description
event_inherited()
/*if (obj_solution_manager.show_state_board) {
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(spr_dialog2, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
	gpu_set_blendmode(bm_normal)
}*/
var t = "Clear Board"
var c = c_white
draw_text_transformed_color(x,y,t, 1,1, 0,c,c,c,c, 1)



