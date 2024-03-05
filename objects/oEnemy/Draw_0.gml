// Draws Enemy Sprite
draw_self();

// When enemy is hit by projectile
if(flash > 0)
{
	// flash value resets back to 0 after 3 frame
	flash--;
	
	// Draws Enemy Sprite White
	shader_set(shWhite);
	draw_self();
	shader_reset();
}