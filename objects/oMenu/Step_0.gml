/// @description Control Menu

// Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

// Menu Controls
if(menu_control)
{
	if(gamepad_button_check_pressed(0, gp_padu)) || keyboard_check_pressed(ord("W"))
	{
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(gamepad_button_check_pressed(0, gp_padd)) || keyboard_check_pressed(ord("S"))
	{
		menu_cursor--;
		if(menu_cursor < 0) menu_cursor = menu_items-1;
	}
	// Checks if 'A' Xbox button or Left mouse click is pressed
	if(gamepad_button_check_pressed(0, gp_face1)) || mouse_check_button_pressed(mb_left)
	{
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		// Optional Add screenshake
		menu_control = false;
	}
}

if(menu_x > gui_width+150) && (menu_committed != -1)
{
	switch(menu_committed)
	{
		case 2: default: SlideTransition(TRANS_MODE.NEXT); break;
		
		case 1: 
		{
			if(!file_exists(SAVEFILE))
			{
				SlideTransition(TRANS_MODE.NEXT); break;
			}
			else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);	
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO, target);
			}
		}
		break;
		case 0: game_end(); break;
	}
}