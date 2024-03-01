// framerate logic

// check for key inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);


// no movement if both left and right keys are pressed
var move = key_right - key_left;
// calculate mm
hsp = move * walksp;

// calculate grav
vsp = vsp + grv;

// jump only if on the floor
if(place_meeting(x, y+1, oWall)) && (key_jump)
{
	vsp = -4;
}


// Check for horizontal collision
if(place_meeting(x+hsp, y, oWall))
{
	while(!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
// x coordinate movement
x = x + hsp;


// Check for vertical collision
if(place_meeting(x, y+vsp, oWall))
{
	while(!place_meeting(x, y+sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
// y coordinate movement
y = y + vsp;


// Air Animation
if(!place_meeting(x, y+1, oWall))
{
	sprite_index = sPlayerAir;
	image_speed = 0;
	// image_index is for what frame of sprite index we want
	if(sign(vsp) > 0) image_index = 1; else image_index = 0;
}
// Ground Animation
else
{
	image_speed = 1;
	if(hsp == 0)
	{
		sprite_index = sPlayer;		// idle animation
	}
	else
	{
		sprite_index = sPlayerR;	// running animation
	}
}

if(hsp != 0) image_xscale = sign(hsp);


