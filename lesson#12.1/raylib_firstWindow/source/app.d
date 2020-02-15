import std.stdio: writeln;
import std.string: toStringz;

import raylib;

// structure is a user defined data type
// it allows to combine existing data types to define a new type
struct Entity {
	Texture2D tex;

	int x;
	int y;

	// member function: no need for arguments, member variables are visible to the function
	void draw() {
		DrawTexture(tex, x, y, WHITE);
	}

	// constructor this() {}
	this(string path, int posX, int posY) {
		tex = LoadTexture(path.toStringz);

		x = posX;
		y = posY;
	}

	// destructor ~this() {}
	~this() {
		UnloadTexture(tex);
	}
}

void main() {
	// creating window
	InitWindow(720, 640, "Dlang Raylib Window");
	SetTargetFPS(30); // frames per second

	// initialization using a constructor
	Entity entity = Entity("car.png", 100, 50);

	/* manual initialization
		entity.tex = LoadTexture(path.toStringz);
		entity.x = 100;
		entity.y = 50;
	*/

	while(!WindowShouldClose()) {
		// process events

		// update

		// draw
		BeginDrawing(); 		// clear the screen
		ClearBackground(WHITE); // set background color to WHITE

		entity.draw(); // draw entity texture to the window

		// display
		EndDrawing();
	}

	// no need to free the entity texture memory
	// entity destructor frees the texture memory once the program quits

	// close the window and quit
	CloseWindow();
}
