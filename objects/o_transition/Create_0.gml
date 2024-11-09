//Variables

//If the transition is in or out
in = true;
out = false;

//The target room
target_room = -1;

//The position of the camera where the transition should play
camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);

//The width and height the transition and surface should be
width = surface_get_width(application_surface);
height = surface_get_height(application_surface);

//The size of the circle in the transition and the maximum size it should scale to
max_size = width;
circle_size = max_size;

//Create a surface
surf = surface_create(width, height, surface_rgba8unorm);