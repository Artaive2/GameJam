//Draw the sprite
sprite_index = my_sprite;
draw_self();

//Drawing the light coming out of the screen
gpu_set_blendmode(bm_add);
draw_set_alpha(.3);
draw_circle_colour(x - 1, y - 7, 30, c_white, c_black, 0);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);