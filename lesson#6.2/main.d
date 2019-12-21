//	Creating Hangman game
//	LET'S LEARN: for loop, random number generator

import std.stdio: writeln, write, readln, readf;
import std.string: strip;
import std.random: uniform; // random number generator function

void main() {
	int lives = 3;

	// dictionary contains words that player will have to guess
	string[10] dictionary = [ "apple", "orange", "volleyball", "laptop",
							"universe", "chicken", "theater", "window",
							"violin", "guitar" ];
					
	// generate a random number (index)		
	int index = uniform(0, 10);
	string word = dictionary[index]; 		// copy the selected word
	char[] displayWord; 					// we print it to the screen
	for(int i = 0; i < word.length; i++) {	// initialize displayWord by '_' to depict how many letter the selected word has
		displayWord ~= '_';
	}

	// calling main menu function
	bool gameOver = mainMenu();			// mainMenu return false if player decides to play, true if player exits

	char guess;							// a variable to store player's guess
	int lettersGuessed = 0; 			// we need to know how many letters were guessed
	while(!gameOver) {
		printWord(displayWord);

		write("Your guess, please (", lives, " lives): ");
		readf(" %s", guess); 			// read player's guess

		int temp = lettersGuessed; 		// save how many letters were guessed
		for(int i = 0; i < word.length; i++) {
			if(guess == word[i]) {
				displayWord[i] = word[i];
				lettersGuessed += 1;
			}
		}

		if(temp == lettersGuessed) { 	// if player didn't guess correctly, lives = lives - 1
			lives--;
		}

		if(displayWord == word) { 		// if player guessed everything correctly, he won
			writeln();
			writeln("You won!");

			break;
		} else if(lives < 0) { 			// if player has no more lives left, he lost the game, and we print the selected word
			writeln();
			writeln("You lost!");
			writeln("You had to guess: ", word);
			break;
		}
	}

	// when the game is over:
	writeln("Thank you for playing!");
}

bool mainMenu() {
	writeln("Hello! Welcome to Hangman game!");
	writeln("(1) Play");
	writeln("(2) Exit");
	write(":_");

	string line = strip(readln());
	if(line == "play" || line == "Play" || line == "1" || line == "p") { // if line = to either of these, then play, else, quit
		return false;
	}

	return true;
}

void printWord(char[] word) {
	for(int i = 0; i < 3; i++) {
		writeln();
	}

	for(int i = 0; i < word.length; i++) {
		write(" ", word[i]);
	}

	for(int i = 0; i < 3; i++) {
		writeln();
	}
}





