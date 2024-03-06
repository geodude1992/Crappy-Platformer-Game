/// @description Set up Camera
cam = view_camera[0];

follow = oBullet;

// middle point of the camera rectangle
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

// Represents the coordinate point we are moving at any point
xTo = xstart;
yTo = ystart;