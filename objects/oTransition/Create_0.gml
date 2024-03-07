// @description Size Variables and mode setup
// part 7
w = display_get_gui_width();
h = display_get_gui_height();

h_half = h * 0.5;
// transition mode
// used to turn a set of ordered numbers into english words
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANS_MODE.OFF;
percent = 1;
// holds the variable to the next room to transition to
target = room;