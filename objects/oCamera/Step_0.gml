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

// Update camera view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);
