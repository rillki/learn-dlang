import data;
import gstatemanager;

import menu;
import play;

void main() {
    validateRaylibBinding();
    
    // init
    InitWindow(windowWidth, windowHeight, "Mission X");
    scope(exit) { CloseWindow(); }

    // set frames per second
    SetTargetFPS(60);

    // declaring and initializing menu and play states
    Menu menu = new Menu();
    Play play = new Play();

    GStateManager.getInstance.setState(GameState.MainMenu);
    
    GStateManager.getInstance.add(menu, GameState.MainMenu);
    GStateManager.getInstance.add(play, GameState.Play);
    GStateManager.getInstance.add(null, GameState.Exit);

    // outputs "*** menu state ***"
    //GStateManager.getInstance.execute();

    // change current state to play
    //GStateManager.getInstance.setState(GameState.Play);

    while(!WindowShouldClose() && GStateManager.getInstance.getState != GameState.Exit) {
	GStateManager.getInstance.execute();
    }

    // outputs "*** play state ***"
    //GStateManager.getInstance.execute();
}















