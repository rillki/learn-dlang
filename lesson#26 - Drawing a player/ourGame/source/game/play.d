module game.play;

import game.data;
import game.gstatemanager;
import game.player;

import std.file: getcwd;
import std.path: buildPath;
import std.string: toStringz;

class Play: IState {
	// variables
	private {
		Texture2D texPlayer;
		Player player;
	}
	
    this() {
    	texPlayer = LoadTexture(getcwd.buildPath("../../assets/PNG/Player/player_tilesheet.png").toStringz);
    	player = new Player(texPlayer, Rectangle(0, 0, 80, 110), Vector2(0, 0));
    }
    
    ~this() {
    	UnloadTexture(texPlayer);
    }

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
		player.draw();
    }
}
