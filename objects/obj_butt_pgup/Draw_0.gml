/// @description
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_self()

if hover {
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
	gpu_set_blendmode(bm_normal)
}

var t = "^"
draw_text(x,y,t)




