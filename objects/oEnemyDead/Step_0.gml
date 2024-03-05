if(done == 0)
{
	// calculate grav
	vsp = vsp + grv;


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
		if(vsp > 0) 
		{
			done = 1;
			// changes dead image to the second sprite
			image_index = 1;
		}
		
		while(!place_meeting(x, y+sign(vsp), oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	// y coordinate movement
	y = y + vsp;
}