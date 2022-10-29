/// @description
var translucent = instance_exists(obj_choose_gem) ? 0.5 : 1
var rot = -current_time / 50
var rot2 = current_time / 10
var alpha = abs(sin(current_time / 650))
var alpha2 = abs(cos(current_time / 650))
draw_sprite_ext(sprite_index, gem, x, y, 1, 1, 0, c_white, translucent)
if (gem == BOMB) draw_text(x, y, gem_value)
else if (gem_power) && (gem < 7) {
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(spr_power, 0, x, y, 0.5, 0.5, rot, c_white, alpha)
	draw_sprite_ext(spr_power, 0, x, y, 0.5, 0.5, rot2, c_white, alpha2)
	gpu_set_blendmode(bm_normal)
}





