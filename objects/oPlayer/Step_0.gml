// framerate logic

// check for key inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);

// no movement if both left and right keys are pressed
var move = key_right - key_left;
// calculate mm
hsp = move * walksp;

// check for horizontal collision
if(place_meeting(x+hsp, y, oWall))
{
	while(!place_meeting(x+sign(hsp), y, oWall))
	{
		
	}
	hsp = 0;
}


// x coordinate movement
x = x + hsp;