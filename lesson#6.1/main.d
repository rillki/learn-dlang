//	Creating Hangman game
//	LET'S LEARN: arrays(fixed-length vs dynamic),
//			strings(char[] vs string) and immutability,
//			reading strings from the user

import std.stdio: writeln, write, readln;
import std.string: strip;

void main() {

	/* School event: 10 participants, age and names
		int age1 = 0;
		int age2 = 0;
		...
		int age10 = 0;
	*/

	//------------------------------------

	/*
		data_type[size] name;
		name[index] to access the ith element
		name[0 ... < size]

		int[10] name; 	// [0 ... 9]
		name[6] = ...	// ok, 6 < 10
		name[12] = ... 	// error, 12 > 10
		name[10] = ... 	// error, 10 is not < 10
	*/

	int[10] age = 0; 		// all age variables = 0;
	char[21] oneName; 		// one dimensinal array, we assume name is no longer than 21
	char[10][21] manyNames; 	// an array of one dimesional arrays of characters

	/*
		data_type[size_rows][size_cols] name;
		name[0 ... < size_rows][0 ... < size_cols] = ...
	*/

	string oneName_string; 		// the same as char[]
	string[10] manyNames_string; 	// the same as char[10][]

	//------------------------------------

	// trying to modify a string element
/*	string fruit = "apple";
	fruit[0] = 'A'; 		// error

	fruit = "orange"; 		// fine

	string[] shoppingList = [ "potato", "apples", "milk", "etc..." ];
*/
	//------------------------------------
/*	
	int[] myDynamicArray;
	writeln("Size of myDynamicArray: ", myDynamicArray.length);

	myDynamicArray.length = 3;
	writeln("NEW SIZE of myDynamicArray: ", myDynamicArray.length);

	myDynamicArray ~= 15;
	myDynamicArray ~= 98;
	myDynamicArray ~= 43;

	writeln(myDynamicArray);
*/
	//------------------------------------

/*	write("Hi, what's your name: ");
	//string name = readln(); 		// reads a '\n' new line character
	string name = strip(readln()); 		// use strip to remove '\n'

	writeln("Hi, ", name, ". Nice to meet you!");
*/
	//------------------------------------
/*
	string name = "alex";
	name[0] = 'A'; 			// error, immutable expression

	char[] name = "joshua";
	name[0] = 'J'; 			// fine
*/	
	//------------------------------------
	
	int lives = 3;

	// dictionary contains words that player will have to guess
	string[10] dictionary = [ "apple", "orange", "volleyball", "laptop",
				"universe", "chicken", "theater", "window",
				"violin", "guitar" ];

	// calling main menu function
	mainMenu();

	// when the game is over:
	writeln();
	writeln("Thank you for playing!");

}

void mainMenu() {
	writeln("Hello! Welcome to Hangman game!");
	writeln("(1) Play");
	writeln("(2) Exit");
	write(":_");

	string line = strip(readln());
	if(line == "play" || line == "Play" || line == "1") {
		writeln();
		writeln("let's play!");
	}
}





