import std.stdio: writeln;

import raylib;

void main() {
	// creating window
	InitWindow(720, 640, "Dlang Raylib Window");

	// loading texture
	Texture2D image = LoadTexture("car.png");
	// resizing the texture
	image.width = image.height = 240;

	while(!WindowShouldClose()) {
		// process events

		// update

		// draw
		BeginDrawing(); 		// clear the screen
		ClearBackground(Colors.WHITE); 	// set background color to WHITE

		// draw "Hello, World!"
		DrawText("Hello, World!", 10, 10, 60, Colors.BLACK);

		// draw a square 50x50
		DrawRectangle(100, 100, 50, 50, Colors.BLACK);

		// draw a circle of radius = 100
		DrawCircle(100, 200, 50, Colors.BLACK);

		// draw the image
		DrawTexture(image, 100, 400, Colors.WHITE);

		// display
		EndDrawing();
	}

	// free res
	UnloadTexture(image);

	// close the window and quit
	CloseWindow();
}
