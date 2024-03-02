// Gun position
x = oPlayer.x+10;
y = oPlayer.y+3;


image_angle = point_direction(x, y, mouse_x, mouse_y);

firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

if(mouse_check_button(mb_left)) && (firingdelay < 0)
{
	// affects gun not bullet
	recoil = 4;
	firingdelay = 5;
	with(instance_create_layer(x,y,"Bullet", oBullet))
	{
		speed = 25;
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
}
else
{
	image_yscale = 1;
}