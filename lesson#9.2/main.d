//	Creating Battleship game

import std.stdio: writeln, write, readf;

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

	writeln("\n\n");
	writeln("Thanks for playing!");
}

// print 10 empty lines (for formatting)
void clear() {
	for(int i = 0; i < 10; i++) {
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

	writeln(".... GAME PLAY ....\n\n");

	gameState = GameState.EXIT;
}

