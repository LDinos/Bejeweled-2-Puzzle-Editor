/// @description

/* ENTRY (Little endian)*/
//BF 13 3F 03 01 00 00 00 00 00 08 00 50 75 7A 7A 4E 61 6D 65 08 00 50 75 7A 7A 48 69 6E 74 08 00 53 6F 6C 75 74 69 6F 6E
/*var buffer = buffer_create(1, buffer_grow, 1)
buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u32, 54465471)
buffer_write(buffer, buffer_u32, 1)
buffer_write(buffer, buffer_u32, 524288)
buffer_write(buffer, buffer_u32, 2054845776)
buffer_write(buffer, buffer_u32, 1701667150)
buffer_write(buffer, buffer_u32, 1968177160)
buffer_write(buffer, buffer_u32, 1766357626)
buffer_write(buffer, buffer_u32, 554094)
buffer_write(buffer, buffer_u32, 1970040659)
buffer_write(buffer, buffer_u32, 1852795252)
buffer_save(buffer, "test")
*/
#macro BOMB 7
#macro ROCK 8
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

