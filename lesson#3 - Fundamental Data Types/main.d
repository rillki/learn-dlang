//	FUNDAMENTAL DATA TYPES

//	this is a single line comment, it is ignored by the compiler

/*	
	this is a multiline comment
	...
	it is completely ignored by the compiler
*/

import std.stdio; 		//	standard input/output library

void main() {
	// 3 basic types: integers, floating-point, characters

	//	basic data types
	int a;			//	declaration of a variable
	float b = 12.5;		//	initialization and declaration
	double c;		//	double precision of float
	char e;			//	a single character
	char letterA = 'A';

	//	outputing the value of variable b
	writeln("The value of b: ", b);
	writeln("The value of letterA: ", letterA);

	// outputting multiple values
	int num = 115;
	int num2 = num;
	int num3 = num2;
	writeln("Num=", num, " Num2=", num2, " Num3=", num3);

	writeln(); // a new line

	// integer types
	/*
		signed types (positive and negative):
		byte 	1 bytes
		short	2 ...
		int 	4 ...
		long 	8 bytes

		usigned types (only positive):
		ubyte 	1 bytes
		ushort 	2 ...
		uint	4 ...
		ulong 	8 bytes
	*/


	//	properties of types
	writeln("Name of the type : ", int.stringof);
	writeln("Size in bytes: ", int.sizeof);
	writeln("Min value : ", int.min);
	writeln("Max value : ", int.max);
	writeln("Initial value : ", int.init);

	/*
		Exercise:
			Check out what are the initial values of float, double, char.
			Write a comment about what you found.
	*/

}
