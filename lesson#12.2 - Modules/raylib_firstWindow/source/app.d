import test;

import raylib;

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
		ClearBackground(Colors.WHITE); // set background color to WHITE

		entity.draw(); // draw entity texture to the window

		// display
		EndDrawing();
	}

	// no need to free the entity texture memory
	// entity destructor frees the texture memory once the program quits

	// close the window and quit
	CloseWindow();
}
