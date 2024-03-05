// framerate logic

// check for key inputs
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);


// checks if keyboard input is detected
if(key_left) || key_right || (key_jump)
{
	controller = 0;
}

// checks for controller input - axisLeftstickHorizontal - set deadzone
if(abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
{
	key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
	key_right = max(gamepad_axis_value(0, gp_axislh), 0);
	controller = 1;
}
 
// check for jump - gpface1 == "A button" on xbox controller
if(gamepad_button_check_pressed(0,gp_face1))
{
	key_jump = 1;
	controller = 1;
}


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

// Flip Player Sprite when moving left
if(hsp != 0) image_xscale = sign(hsp);


