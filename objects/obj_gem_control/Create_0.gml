/// @description
#macro BOMB 7
#macro ROCK 8
#macro HYPERCUBE 9
gem = 0
gem_power = 0
gem_value = 0
image_speed = 0

function add_value() {
	if (gem == BOMB) {
		gem_value++
		gem_value = clamp(gem_value, 0, 255)
	}
}

function subtract_value() {
	if (gem == BOMB) {
		gem_value--
		gem_value = clamp(gem_value, 0, 255)
	}
}

