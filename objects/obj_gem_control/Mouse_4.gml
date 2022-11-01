/// @description
audio_play_sound(snd_butt_click,0,false)
if instance_exists(obj_choose_gem) instance_destroy(obj_choose_gem)
else instance_create_depth(x - GRID_SIZE*2.25, y - GRID_SIZE, depth, obj_choose_gem)




