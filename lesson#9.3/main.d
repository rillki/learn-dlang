//	Finishing Battleship game

import std.stdio: writeln, write, readf;
import std.conv: to;
import std.random: uniform;

// game states
enum GameState {
	MENU, PLAY, HELP, EXIT
}

/*
	gameState = MENU; -> mainMenu();	// managing main menu
	gameState = HELP; -> help();		// how to play
	gameState = PLAY; -> play();		// game logic
	gameState = EXIT; -> break out from the loop and quit
*/

immutable int NUM_SHIPS = 10;

void main() {
	// gameState variable
	GameState gameState = GameState.MENU;

	// while gameState does not equal to EXIT, run the game
	while(gameState != GameState.EXIT) {
		if(gameState == GameState.MENU) {
			mainMenu(gameState);
		} else if(gameState == GameState.HELP) {
			help(gameState);
		} if(gameState == GameState.PLAY) {
			gamePlay(gameState);
		}
	}

	writeln("Thanks for playing!");
}

// print 10 empty lines (for formatting)
void clear() {
	for(int i = 0; i < 30; i++) {
		writeln();
	}
}

// MENU state: the code for handling main menu
void mainMenu(ref GameState gameState) {
	clear(); 

	writeln("Hi and welcome!");
	writeln();
	writeln("(1) Play");
	writeln("(2) Help");
	writeln("(3) Exit");
	writeln();
	write("Choice >> :_");

	char c;
	readf(" %s", c);
	if(c == '1' || c == 'p' || c == 'P') {
		gameState = GameState.PLAY;
	} else if(c == '2' || c == 'h' || c == 'H') {
		gameState = GameState.HELP;
	} else if(c == '3' || c == 'e' || c == 'E') {
		gameState = GameState.EXIT;
	} else {
		writeln("\n\nError! Please try again!\n");
	}
}

// HELP state: displaying helpful information
void help(ref GameState gameState) {
	clear();

	writeln("1. Each player must secretly place their ships on a grid \nof ten columns by ten rows.");
	writeln("\n2. Each player will also be in possession of a second grid \nof the same size. Where the first grid is their own ships, \nthe second one (which is blank at the beginning of the game) \nis a mirror of their opponent’s battlefield.");
	writeln("\n3. Players pick a square at random, calling it by its row and \ncolumn number. This represents their firing a missile \ndirectly at that square.");
	writeln("\n4. The player who successfully locates all their opponent’s \nships first by hitting each square they occupy is the winner \nas all ships have been destroyed.");

	write("\nChoice(2) >> :_");

	char c;
	readf(" %s", c);
	gameState = GameState.MENU;
}

// PLAY state: game logic
void gamePlay(ref GameState gameState) {
	clear();

	// creating our maps
	char[5][5] playerMap = ' ';
	char[5][5] enemyMap = ' ';
	char[5][5] territory = ' ';

	// initializing ships
	initShipPos(playerMap); 	// init player's ships (manually, by the player himself)
	initEnemyShipPos(enemyMap); // init enemy's ships (randomization)

	int player_ships_destroyed = 0;
	int enemy_ships_destroyed = 0;
	bool gameWon = false;
	while(gameState != GameState.EXIT) {
		// displaying player's map
		writeln("Your MAP, Captain: ");
		display(playerMap);

		// displaying empty territory
		writeln("\n", "Enemy's hiding somewhere, Captain: ");
		display(territory);

		writeln("Let's scout the area and attack (", player_ships_destroyed, " of ", NUM_SHIPS, " ships destroyed)!");

		// reading user input
		char x;
		char y;
		write("X coord to attack(e to exit): >>_"); readf(" %s", x);
		if(x == 'e') { 						// if input = 'e', exit the game
			gameState = GameState.EXIT;
		}

		write("Y coord to attack(e to exit): >>_"); readf(" %s", y);
		if(y == 'e') { 						// if input = 'e', exit the game
			gameState = GameState.EXIT;
		}

		// converting (x, y) coordinates to integers
		int ix = to!int(x - '0');
		int iy = to!int(y - '0');
		
		clear(); // clearing the screen by inserting new lines
		// if (x, y) coordinates are greater than the bounds of the map or are negative, go to the begining
		if(ix < 0 || ix > territory.length-1 || iy < 0 || iy > territory.length-1) {
			continue;
		}

		// if the coordinate isn't empty, go to the begining
		if(territory[ix][iy] != ' ') {
			continue;
		}

		// if player hit enemy's ship, mark it with 'x', otherwise mark it with'o'
		if(enemyMap[ix][iy] == '1') {
			territory[ix][iy] = enemyMap[ix][iy] = 'x';
			player_ships_destroyed++;
		} else {
			territory[ix][iy] = enemyMap[ix][iy] = 'o';
		}

		// if player destroyed all of the enemy's ships, exit
		if(player_ships_destroyed >= NUM_SHIPS) {
			gameState = GameState.EXIT;
			gameWon = true; 				// the player has won
		}

		enemyAttack(playerMap, enemy_ships_destroyed);

		// if enemy destroyed all of the player's ships, exit
		if(enemy_ships_destroyed >= NUM_SHIPS) {
			gameState = GameState.EXIT;
			gameWon = false; 				// the player has lost
		}
	}

	clear();
	if(gameWon) {
		writeln("YOU WON!");
	} else {
		writeln("Your MAP, Captain: ");
		display(playerMap);
		writeln("\nYOU LOST!");
	}
}

// read the comments in the gamePlay function, the code is pretty much the same
void initShipPos(ref char[5][5] array) {
	int i = 0;
	while(i < NUM_SHIPS) {
		display(array);

		writeln("Enter your ship's position(", i, " of ", NUM_SHIPS," ships):");

		char x;
		char y;
		write("X coord: >>_"); readf(" %s", x);
		write("Y coord: >>_"); readf(" %s", y);

		int ix = to!int(x - '0');
		int iy = to!int(y - '0');
		
		clear();
		
		if(ix < 0 || ix > array.length-1 || iy < 0 || iy > array.length-1) {
			writeln("\nERROR! TRY AGAIN!");
			continue;
		}

		if(array[ix][iy] != ' ') {
			writeln("\nERROR! SHIP (", ix, ", ", iy, ") ALREADY EXISTS!");
			writeln("TRY AGAIN!\n");
			continue;
		}

		array[ix][iy] = '1';

		i++;
	}
}

// randomizing enemy's ships
void initEnemyShipPos(ref char[5][5] array) {
	int i = 0;
	while(i < NUM_SHIPS) {
		int x = uniform(0, array.length.to!int);
		int y = uniform(0, array.length.to!int);

		if(array[x][y] != ' ') {
			continue;
		}

		array[x][y] = '1';
		i++;
	}
}

void enemyAttack(ref char[5][5] array, ref int ships_destroyed) {
	while(true) {
		int x = uniform(0, array.length.to!int);
		int y = uniform(0, array.length.to!int);

		// if enemy has already attacked this position, go to the beginig of the loop
		if(array[x][y] == 'x' || array[x][y] == 'o') {
			continue;
		}

		// if ship is found, destroy the ship
		if(array[x][y] == '1') {
			array[x][y] = 'x';
			ships_destroyed++;
		} else {
			array[x][y] = 'o'; // otherwise, mark it with 'o'
		}

		break;
	}
}

// printing the entire array in a table-like format
void display(char[5][5] array) {
	write("  ");
	for(int i = 0; i < array.length; i++) {
		write("   ", i); // '\t' character means tab
	}
	writeln();

	writeln("_ _ _ _ _ _ _ _ _ _ _ _");
	for(int i  = 0; i < array.length; i++) {
		write(i, " ");
		for(int j = 0; j < array[i].length; j++) {
			write(" | ", array[i][j]);
		}
		writeln();
		writeln("_ _ _ _ _ _ _ _ _ _ _ _");
	}

	writeln();
	writeln();
}






















