import data;
import gstatemanager;

import menu;
import play;

void main() {
    /*
    validateRaylibBinding();
    
	// init
    InitWindow(windowWidth, windowHeight, "Mission X");
    scope(exit) CloseWindow();

	// set frames per second
    SetTargetFPS(60);

    while(!WindowShouldClose()) {
        // process events

        // update
		// calling the dummy function
		GStateManager.getInstance().hello_world();

        // render
        BeginDrawing();
		scope(exit) EndDrawing();

        ClearBackground(Colors.WHITE);
		// .. draw ..
    }*/

    // declaring and initializing menu and play states
    Menu menu = new Menu();
    Play play = new Play();

    // calling execute function: nothing happens, since state is null
    GStateManager.getInstance.execute();

    // change current state to menu
    GStateManager.getInstance.setState(menu);
    // outputs "*** menu state ***"
    GStateManager.getInstance.execute();

    // change current state to play
    GStateManager.getInstance.setState(play);
    // outputs "*** play state ***"
    GStateManager.getInstance.execute();
}















