shader_set(shr_wavy);
shader_set_uniform_f(uTime, current_time);
var tex = sprite_get_texture(spr_loadarom, 0);
shader_set_uniform_f(uTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));
draw_sprite_ext(spr_loadarom, 0, x, y, 2, 2, 0, c_white, 1);
shader_reset();