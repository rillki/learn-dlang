import raylib;

import std.string: toStringz;				// for converting D string into C string
import std.random: uniform;					// random number generator

immutable int windowSize = 320;				// window width and height
immutable int blockSize = 16;				// entity size

enum GameStates { play, exit }				// game states
enum Direction { up, down, left, right }	// direction

// Fruit struct -> generates a fruit at random location
struct Fruit {
	Rectangle rect;			// rectangle

	bool eaten = true;		// if eaten == false, generate new fruit

	void generateFruit() {
		// randomize fruit's position
		rect = Rectangle(uniform(0, windowSize/blockSize)*blockSize,
							uniform(0, windowSize/blockSize)*blockSize, blockSize, blockSize);
	}

	// update the fruit
	void update() {
		if(eaten) {
			generateFruit();
			eaten = false;
		}
	}

	// draw the fruit, if eaten, skip
	void render() {
		if(eaten) {
			return;
		}

		DrawRectangleRec(rect, GREEN);
	}
}

// Snake struct -> takes care of snake entity (updating snake logic, growing, movement, etc...)
struct Snake {
	Rectangle[100] rect = Rectangle(-blockSize, -blockSize, blockSize, blockSize);	// the snake: array of maximum snake length
	Direction dir = Direction.up;		// direction

	int length = 5;						// snake length (max is windowSize^2 = 400 entities (16x16 size))

	// init
	this(int posX, int posY) {
		rect[0] = Rectangle(posX, posY, blockSize, blockSize);
	}

	// game logic
	void update() {
		// moving the tail
		for(int i = length; i > 0; i--) {
			rect[i].x = rect[i-1].x;
			rect[i].y = rect[i-1].y;
		}

		// moving the snake head
		if(dir == Direction.up) {
			rect[0].y -= blockSize;
		} else if(dir == Direction.down) {
			rect[0].y += blockSize;
		} else if(dir == Direction.left) {
			rect[0].x -= blockSize;
		} else if(dir == Direction.right) {
			rect[0].x += blockSize;
		}

		// keeping the snake within the bounds of our window
		if(rect[0].x < 0) {
			rect[0].x = windowSize-blockSize;
		} else if (rect[0].x > windowSize) {
			rect[0].x = 0;
		} else if(rect[0].y < 0) {
			rect[0].y = windowSize-blockSize;
		} else if (rect[0].y > windowSize) {
			rect[0].y = 0;
		}
	}

	// drawing
	void render() {
		for(int i = 0; i < length; i++) {
			DrawRectangleRec(rect[i], RED);
		}
	}

    // grow tail
	void grow() {
		length++;
	}
}

// Game struct -> manages gameplay logic, events, drawing
struct Game {
    GameStates gstate = GameStates.play;

	Snake snake = Snake(windowSize/2, windowSize/2);
	Fruit fruit = Fruit();

	bool gameOver = false;
	double time = 0;

	// initializing the game
    this(string title) {
        InitWindow(windowSize, windowSize, title.toStringz);
        SetTargetFPS(30);
    }

	// freing resources in the end of the game
    ~this() {
        CloseWindow();
    }

	// processing game events
    void processEvents() {
        if(WindowShouldClose()) {
            gstate = GameStates.exit;
        } else if(IsKeyPressed(KeyboardKey.KEY_UP)) {
			snake.dir = Direction.up;
		} else if(IsKeyPressed(KeyboardKey.KEY_DOWN)) {
			snake.dir = Direction.down;
		} else if(IsKeyPressed(KeyboardKey.KEY_LEFT)) {
			snake.dir = Direction.left;
		} else if(IsKeyPressed(KeyboardKey.KEY_RIGHT)) {
			snake.dir = Direction.right;
		}
    }

	// updating game logic
	void update() {
		if(!gameOver) {
			// update the snake
	        time += GetFrameTime();
			if(time > 0.12) {
				time = 0;

				// check whether the head of the snake has bumbed into its tail
				for(int i = 1; i < snake.length; i++) {
					if(snake.rect[0].x == snake.rect[i].x && snake.rect[0].y == snake.rect[i].y) {
						gameOver = true;
					}
				}

				// check if the snake has eaten the fruit
				if(snake.rect[0].x == fruit.rect.x && snake.rect[0].y == fruit.rect.y){
					fruit.eaten = true;

					snake.grow();
				}

				// update the fruit
				fruit.update();

				// update the snake
				snake.update();
			}
		}
    }

	// drawing
	void render() {
        BeginDrawing();
		ClearBackground(WHITE);

        // drawing the grid
        for(int i = 1; i < windowSize/blockSize; i++) {
            DrawLineEx(Vector2(blockSize*i, 0), Vector2(blockSize*i, windowSize), 1, BLACK);
            DrawLineEx(Vector2(0, blockSize*i), Vector2(windowSize, blockSize*i), 1, BLACK);
        }

		fruit.render();
		snake.render();

		if(gameOver) {
			DrawRectangleRec(Rectangle(0, 0, windowSize, windowSize), Color(0, 0, 0, 150));
			DrawText("Game Over!", 30, windowSize/2-48, 48, WHITE);
		}

		DrawFPS(10, 10);
        EndDrawing();
    }
}


void main() {
	// init
	Game game = Game("Dlang Snake Game");

	// game loop
	while(game.gstate != GameStates.exit) {
		game.processEvents();
		game.update();
		game.render();
	}
}
