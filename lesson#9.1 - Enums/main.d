//	Creating Battleship game (hints)
//	LET'S LEARN: enums

import std.stdio: writeln;
import std.conv: to;

// enum is a user defined type
// enum TypeName { ValueName_1, ValueName_2, /* etc. */ }

enum Colors {
	RED=5, ORANGE, YELLOW, GREEN, BLUE, PURPLE, BROWN, BLACK
}

/*
	// anonymous enum
	enum {
		RED=5, ORANGE, YELLOW, GREEN, BLUE, PURPLE, BROWN, BLACK
	}
*/

void main() {
	Colors background_color = Colors.RED;

	writeln("Minimum value of Colors: ", Colors.min);
	writeln("Maximum value of Colors: ", Colors.max);
	writeln("Storage size of Colors:  ", Colors.sizeof);

	writeln("\n"); // '\n' => new line character

	writeln("value of Colors.RED:    ", Colors.RED.to!int); 	// converting to integer, otherwise it outputs RED
	writeln("value of Colors.ORANGE: ", Colors.ORANGE.to!int); 	// converting to integer, otherwise it outputs ORANGE
	writeln("value of Colors.YELLOW: ", Colors.YELLOW.to!int); 	// converting to integer, otherwise it outputs YELLOW

/*
	int variable = RED;
	writeln("variable = ", RED);
*/
}