module data;

import raylib;

immutable int WIDTH = 384;
immutable int HEIGHT = 384;
immutable int SIZE = WIDTH/3;

struct Square {
	Rectangle rect;
	Texture2D tex;

	char type = ' ';

	this(Rectangle r) {
		rect = r;
	}

	void draw() {
		// if the square has no type, return (skip the rest of the code)
		if(type == ' ') {
			return;
		}

		DrawTextureRec(tex, rect, Vector2(rect.x, rect.y), Colors.WHITE);
	}
}

// drawing the Tic Tac Toe grid => 2 vertical and 2 horizontal lines
void drawGrid() {
	DrawLineEx(Vector2(WIDTH/3, 0), Vector2(WIDTH/3, HEIGHT), 3, Colors.WHITE);
	DrawLineEx(Vector2(WIDTH*2/3, 0), Vector2(WIDTH*2/3, HEIGHT), 3, Colors.WHITE);
	DrawLineEx(Vector2(0, HEIGHT/3), Vector2(WIDTH, HEIGHT/3), 3, Colors.WHITE);
	DrawLineEx(Vector2(0, HEIGHT*2/3), Vector2(WIDTH, HEIGHT*2/3), 3, Colors.WHITE);
}