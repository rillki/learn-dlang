module game.state.play;

import game.data;
import game.gstatemanager;
import game.entity.player;
import game.entity.coin;

import std.file: getcwd;
import std.path: buildPath;
import std.string: toStringz;

class Play: IState {
    // variables
    private {
        Texture2D texPlayer, texCoin;
        Player player;
        Coin coin;
    }
    
    this() {
        // player
        texPlayer = LoadTexture(getcwd.buildPath("../../assets/spritesheets/player/woodcutter/Woodcutter.png").toStringz);
        player = new Player(texPlayer, Rectangle(0, 0, 48, 48), Vector2(0, 0));

        // coin
        texCoin = LoadTexture(getcwd.buildPath("../../assets/spritesheets/coins/MonedaD.png").toStringz);
        coin = new Coin(texCoin, Rectangle(0, 0, 16, 16), Vector2(0, 0));
    }
    
    ~this() {
        UnloadTexture(texPlayer);
        UnloadTexture(texCoin);
    }

    // inherited from IState interface
    void run() {
        update();
        processEvents();
        render();
    }
    
    void update() {
        player.update();
        coin.update();
    }

    void processEvents() {
        if(IsKeyPressed(KeyboardKey.KEY_M)) {
            GStateManager.getInstance.setState(GameState.MainMenu);
        }

        player.processEvents(); 
    }

    void render() {
        // enable drawing
        BeginDrawing(); scope(exit) { EndDrawing(); }
    
        // clear background
        ClearBackground(Colors.GRAY);
        
        // draw
        player.draw();
        coin.draw();
    }
}
