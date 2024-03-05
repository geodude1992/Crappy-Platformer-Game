/// @description When killed

if(hp <= 0)
{
	// creates our dead sprite when enemy sprite is dead
	instance_create_layer(x,y,layer,oEnemyDead);
	
	
	// gets rid of our enemy
	instance_destroy();	
}


