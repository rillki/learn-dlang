//	Creating Tic Tac Toe (Noughts and Crosses) game
//	LET'S LEARN: passing a variable by value and by reference

import std.stdio: writeln, write, readf, readln;
import std.string: strip;

void main() {
	// game board
	char[3][3] board = ' ';

	// if true, player 1 makes a move, if false, player 2 makes a move
	bool playerOneMove = true;

	// mainMenu returns false if player decides to play, true if player exits
	bool gameOver = mainMenu();
	while(!gameOver) {
		print(board);

		// read X coordiante
		int x = 0;
		write("x:_");
		readf(" %s", x);

		// read Y coordinate
		int y = 0;
		write("y:_");
		readf(" %s", y);

		// if coordinates point to an empty slot, then make a move, otherwise, it is occupied by another piece
		if(board[y][x] == ' ') {
			if(playerOneMove) {
				board[y][x] = 'x';
			} else {
				board[y][x] = 'o';
			}

			playerOneMove = !playerOneMove;
		} else {
			writeln();
			writeln();
			writeln("*************************************");
			writeln("Position ", x, ", ", y, " is occupied! Try again.");
			writeln("*************************************");
		}

		// checking whether the game is over
		check(board, gameOver);
	}

	print(board);
	if(playerOneMove) {
		writeln("Player O won!");
	} else {
		writeln("Player X won!");
	}
	writeln("Thanks for playing!");
}

bool mainMenu() {
	writeln("Hello! Welcome to Tic Tac Toe game!");
	writeln("(1) Play");
	writeln("(2) Exit");
	write(":_");

	string line = strip(readln());
	if(line == "play" || line == "Play" || line == "1" || line == "p") { // if line = to either of these, then play, else, quit
		return false;
	}

	return true;
}

// drawing the Tic Tac Toe game board
void print(char[3][3] array) {
	writeln();
	writeln();

	for(int i = 0; i < array.length; i++) {
		write("\t", i);
	}
	writeln();

	writeln("_ _ _ _ _ _ _ _ _ _ _ _ _ _");
	for(int i  = 0; i < array.length; i++) {
		write(i);
		for(int j = 0; j < array[i].length; j++) {
			write("   |   ", array[i][j]);
		}
		writeln();
		writeln("_ _ _ _ _ _ _ _ _ _ _ _ _ _");
	}

	writeln();
	writeln();
}

void check(char[3][3] array, ref bool gameOver) {
	// checking if rows are Xs or Os
	for(int i = 0; i < array.length; i++) {
		if(array[i][0] != ' ' && array[i][1] != ' ' && array[i][2] != ' ') {
			if(array[i][0] == array[i][1] && array[i][1] == array[i][2]) {
				gameOver = true;
			}
		}
	} 

	// checking if colomns are Xs or Os
	for(int i = 0; i < array.length; i++) {
		if(array[0][i] != ' ' && array[1][i] != ' ' && array[2][i] != ' ') {
			if(array[0][i] == array[1][i] && array[1][i] == array[2][i]) {
				gameOver = true;
			}
		}
	}

	// checking if the diagonal slots starting from 0, 0 are Xs or Os
	if(array[0][0] != ' ' && array[1][1] != ' ' && array[2][2] != ' ') {
		if(array[0][0] == array[1][1] && array[1][1] == array[2][2]) {
			gameOver = true;
		}
	}

	// checking if the diagonal slots starting from 2, 0 are Xs or Os
	if(array[2][0] != ' ' && array[1][1] != ' ' && array[0][2] != ' ') {
		if(array[2][0] == array[1][1] && array[1][1] == array[0][2]) {
			gameOver = true;
		}
	}
}








