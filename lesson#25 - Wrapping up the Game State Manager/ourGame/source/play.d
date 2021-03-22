module play;

import data;
import gstatemanager;

class Play: IState {
    this() {}

    // inherited from IState interface
    void run() {
	update();
	processEvents();
	render();
    }
    
    void update() {}

    void processEvents() {
	if(IsKeyPressed(KeyboardKey.KEY_M)) {
	    GStateManager.getInstance.setState(GameState.MainMenu);
	}
    }

    void render() {
	// enable drawing
	BeginDrawing(); scope(exit) { EndDrawing(); }
	
	// clear background
	ClearBackground(Colors.YELLOW);
	
	// draw
	// ...
    }
}
