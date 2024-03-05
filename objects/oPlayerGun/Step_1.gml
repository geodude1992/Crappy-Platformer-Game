// Gun position
x = oPlayer.x+5;
y = oPlayer.y+3;


// aimming with keyboard
if(oPlayer.controller == 0)
{
	// aim angle with mouse
	image_angle = point_direction(x, y, mouse_x, mouse_y);
}
// aimming with Controller
else
{
	// value(controller device, stick)
	// horizontal
	var controllerh = gamepad_axis_value(0, gp_axisrh);
	// vertical
	var controllerv = gamepad_axis_value(0, gp_axisrv);	
	
	// set a deadzone
	if(abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
	{
		controllerangle = point_direction(0, 0, controllerh, controllerv);
	}
	image_angle = controllerangle;
}


firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

// check for left mouse click or controller R trigger
if(mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb)) && (firingdelay < 0)
{
	// affects gun not bullet
	recoil = 4;
	// fire rate
	firingdelay = 15;
	with(instance_create_layer(x,y,"Bullet", oBullet))
	{
		// projectile velocity
		speed = 15;
		// other refers to the bullet object
		//direction = other.image_angle;
		direction = other.image_angle + random_range(-2, 2); // add bloom
		image_angle = direction;
	}
}

// recoil in the opposite angle from where the gun is facing
x = x - lengthdir_x(recoil, image_angle)
y = y - lengthdir_y(recoil, image_angle)

// invert gun image if gun sprite is not horizontally symmetric
if(image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
	x = oPlayer.x-5;
}
else
{
	image_yscale = 1;
}