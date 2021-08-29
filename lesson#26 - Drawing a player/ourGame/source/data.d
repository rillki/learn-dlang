module data;

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
	private {
		Texture2D texture;
		Rectangle frame;
		Vector2 position;
	}
	
	this(const ref Texture2D texture, const Rectangle frame, const Vector2 Position) { 
		this.texture = texture;
		this.frame = frame;
		this.position = position;
	}
	
	void move(const float x, const float y) {
		position.x += x;
		position.y += y;
	}
	
	void draw() {
		DrawTextureRec(texture, frame, position, Colors.WHITE);
	}
	
	abstract void update();
}
































