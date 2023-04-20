module game.menu;

import game.data;
import game.gstatemanager;

class Menu: IState {
    this() {}

    // inherited from IState interface
    void run() {
    update();
    processEvents();
    render();
    }

    void update() {}

    void processEvents() {
    if(IsKeyPressed(KeyboardKey.KEY_P)) {
        GStateManager.getInstance.setState(GameState.Play);
    }
    }

    void render() {
    // enable drawing
    BeginDrawing(); scope(exit) { EndDrawing(); }

    // clear background
    ClearBackground(Colors.GREEN);

    // draw
    // ...
    }
}
