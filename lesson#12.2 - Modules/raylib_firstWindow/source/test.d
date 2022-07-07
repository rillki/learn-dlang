module test;

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
		DrawTexture(tex, x, y, Colors.WHITE);
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
