import data;
import gstatemanager;

void main() {
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
    }
}
