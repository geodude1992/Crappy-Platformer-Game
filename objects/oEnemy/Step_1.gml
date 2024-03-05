/// @description When killed

if(hp <= 0)
{
	// creates our dead sprite when enemy sprite is dead
	with(instance_create_layer(x,y,layer,oEnemyDead))
	{
		// direction the dead sprite will move to
		direction = other.hitfrom;
		// hor/vert speed/direction
		hsp = lengthdir_x(2, direction);
		vsp = lengthdir_y(2, direction)-2;
		
		// 
		if(sign(hsp) != 0) image_xscale = sign(hsp);
	}
	
	// gets rid of our enemy
	instance_destroy();	
}

