/// @description GUI/Vars/Menu Setup
#macro SAVEFILE "Save.sav"


gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

gui_margin = 32;

menu_x = gui_width + 350;
menu_y = gui_height - gui_margin;

menu_x_target = gui_width - gui_margin;
menu_speed = 25; // lower is faster

menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);

menu_committed = -1;
menu_control = true;

// drawn from bottom up
menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

// Currently looking at
menu_cursor = 2;

