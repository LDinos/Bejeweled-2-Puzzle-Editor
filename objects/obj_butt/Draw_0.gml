/// @description
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_self()

if hover {
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(spr_dialog2, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
	gpu_set_blendmode(bm_normal)
}




