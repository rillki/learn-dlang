import data;

import raylib;

import std.conv: to;

void main() {
	validateRaylibBinding();
	
	// init
	InitWindow(WIDTH, HEIGHT, "Dlang Tic Tac Toe");
	SetTargetFPS(30);
	SetMouseScale(1.0, 1.0);

	// load textures => x and o
	Texture2D tcross = LoadTexture("res/cross.png");
	Texture2D tnought = LoadTexture("res/nought.png");

	// initialize squares using Square() constructor assinging the corresponding x and y position
	Square[3][3] squares;
	for(int i = 0; i < squares.length; i++) {
		for(int j = 0; j < squares[i].length; j++) {
			squares[i][j] = Square(Rectangle(i*SIZE, j*SIZE, SIZE, SIZE));
		}
	}

	bool playersMove = true;	// tracking whose turn it is to make a move => x or o
	bool draw = false; 		// if gameover and it is a draw
	bool gameOver = false;		// if gameover and somebody has won => x or o

	int empty_squares = 9;
	while(!WindowShouldClose()) {
		//	UPDATE => GAME LOGIC
		Vector2 mousePos = GetMousePosition();

		// checking rows, colomn, diagonals
		if(squares[0][0].type != ' ' && squares[0][0].type == squares[0][1].type && squares[0][1].type == squares[0][2].type) {
			gameOver = true;
		}

		if(squares[1][0].type != ' ' && squares[1][0].type == squares[1][1].type && squares[1][1].type == squares[1][2].type) {
			gameOver = true;
		}

		if(squares[2][0].type != ' ' && squares[2][0].type == squares[2][1].type && squares[2][1].type == squares[2][2].type) {
			gameOver = true;
		}

		if(squares[0][0].type != ' ' && squares[0][0].type == squares[1][0].type && squares[1][0].type == squares[2][0].type) {
			gameOver = true;
		}

		if(squares[0][1].type != ' ' && squares[0][1].type == squares[1][1].type && squares[1][1].type == squares[2][1].type) {
			gameOver = true;
		}

		if(squares[0][2].type != ' ' && squares[0][2].type == squares[1][2].type && squares[1][2].type == squares[2][2].type) {
			gameOver = true;
		}

		if(squares[0][0].type != ' ' && squares[0][0].type == squares[1][1].type && squares[1][1].type == squares[2][2].type) {
			gameOver = true;
		}

		if(squares[2][0].type != ' ' && squares[2][0].type == squares[1][1].type && squares[1][1].type == squares[0][2].type) {
			gameOver = true;
		}

		if(empty_squares < 1 && !gameOver) {
			draw = true;
		}

		// PROCESSING EVENTS 
		if(IsMouseButtonPressed(MouseButton.MOUSE_LEFT_BUTTON) || IsMouseButtonPressed(MouseButton.MOUSE_RIGHT_BUTTON)) {
			// getting i and j ID of squares
			// since we convert x and y pos divided by SIZE to an integer, we get the exact number (i, j) of the square our mouse points to
			// => 90/128 < 0 and if we convert it to an integer we get 0
			int i = to!int(mousePos.x/SIZE);
			int j = to!int(mousePos.y/SIZE);

			// the player cannot override square type, therefore, if a square has been marked by x or o, it stays that way
			if(squares[i][j].type == ' ') {
				if(playersMove) {
					squares[i][j].tex = tcross;
					squares[i][j].type = 'x';
				} else {
					squares[i][j].tex = tnought;
					squares[i][j].type = 'o';
				}

				empty_squares--;
				playersMove = !playersMove;
			}
		}

		// DRAW
		BeginDrawing();
		ClearBackground(Color(0, 179, 255, 255));
		drawGrid();

		// drawing squares
		for(int i = 0; i < squares.length; i++) {
			for(int j = 0; j < squares[i].length; j++) {
				squares[i][j].draw();
			}
		}

		if(draw) { 		// if the game is a draw
			DrawRectangleRec(Rectangle(0, 0, WIDTH, HEIGHT), Color(0, 0, 0, 160));
			DrawText("It's a draw!", WIDTH/16, HEIGHT*2/5, 60, Colors.WHITE);
		} else if(gameOver) { 	// if somebody has won
			DrawRectangleRec(Rectangle(0, 0, WIDTH, HEIGHT), Color(0, 0, 0, 160));
			DrawText("You won!", WIDTH/8, HEIGHT*2/5, 70, Colors.WHITE);
		}

		EndDrawing();
	}

	// free memory
	UnloadTexture(tcross);
	UnloadTexture(tnought);

	// quit
	CloseWindow();
}
