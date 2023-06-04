module game.data;

// mostly used libraries
public import raylib;
public import std.stdio: writeln, write;

// window dimensions
immutable windowWidth = 720;
immutable windowHeight = 640;

// Game states
enum GameState {
    MainMenu,
    Play,
    Exit
}

// state interface
interface IState {
    void run();
}

// entity interface
class Entity {
	Texture2D texture;
	Rectangle frame;
	Vector2 position;
	
	this(in ref Texture2D texture, in Rectangle frame, in Vector2 Position) { 
		this.texture = texture;
		this.frame = frame;
		this.position = position;
	}
	
	void move(in float x, in float y) {
		position.x += x;
		position.y += y;
	}
	
	void draw() {
		DrawTextureRec(texture, frame, position, Colors.WHITE);
	}
	
	abstract void update();
	abstract void processEvents();
}
































