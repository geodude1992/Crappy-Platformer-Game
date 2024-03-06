/// @description Update Camera

// update destination
if(instance_exists(follow)) // checks our player is alive
{
	xTo = follow.x;
	yTo = follow.y;
}

// now move camera
x += (xTo - x) / 25;
y += (yTo - y) / 25;

// stops the camera from viewing OOBs..note: 0+ is not need
x = clamp(x, 0+view_w_half, room_width-view_w_half);
y = clamp(y, 0+view_h_half, room_height-view_h_half);

// Update camera view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);
