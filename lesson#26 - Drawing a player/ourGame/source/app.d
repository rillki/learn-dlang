module app;

import game.data;
import game.gstatemanager;
import game.menu;
import game.play;

void main() {
    // init
    InitWindow(windowWidth, windowHeight, "Mission X");
    scope(exit) { CloseWindow(); }

    // set frames per second
    SetTargetFPS(60);

    // declaring and initializing menu and play states
    Menu menu = new Menu();
    Play play = new Play();
	
	// init GStateManager
    GStateManager.getInstance.setState(GameState.MainMenu);
    GStateManager.getInstance.add(menu, GameState.MainMenu);
    GStateManager.getInstance.add(play, GameState.Play);
    GStateManager.getInstance.add(null, GameState.Exit);
	
	// game loop
    while(!WindowShouldClose() && GStateManager.getInstance.getState != GameState.Exit) {
		GStateManager.getInstance.execute();
    }
}















