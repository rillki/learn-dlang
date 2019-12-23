//	Creating Tic Tac Toe (Noughts and Crosses) game
//	LET'S LEARN: passing a variable by value and by reference

import std.stdio: writeln;

void main() {
	int num = 100;

	writeln("Step 1: num = ", num);

	modify(num);

	writeln("Step 3: num = ", num);
}

/*

// passing by value 
// when passing by value, a function copies the value of the variable to the argument of a function, and modifies the argument (the copy of that variable), 
// not the original variable
void modify(int argument) {
	argument = 70;

	writeln("Step 2: argument(num) = ", argument);
}

*/

// passing by reference
// when passing by reference, a fucntion copies the reference to the variable, and when modifying
// the argument of a function, changes the actual value of the original variable
void modify(ref int argument) {
	argument = 70;

	writeln("Step 2: argument(num) = ", argument);
}