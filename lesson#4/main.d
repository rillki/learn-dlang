//	LET'S CREATE A CALCULATOR!
//	LEARN: USER INPUT, IF STATEMENTS (logical expressions), ARITHMETIC OPERATIONS

//	importing the entire library
//	import std.stdio;

//	importing writeln, write and readf functions
import std.stdio: writeln, write, readf;

void main() {
	float a = 0;
	float b = 0;
	char operation; //	'+', '-', '*', '/'

	write("first number: ");
	readf(" %s", a);

	write("second number: ");
	readf(" %s", b);

	write("operation: ");
	readf(" %s", operation);

	/*
	//	readf could be used to read everything at once
	write("expression: ");
	readf(" %s %s %s", a, operation, b);
	*/

	/*	
		Boolean data type, can either be true or false. 
		bool gameOver = false;

		The syntax of an if statement
		if(condition) {
			instructions;
		} else {
			instructions;
		}

		if(condition1) {
			instructions;
		} else if(condition2) {
			instructions;
		} else if(...) {
			instructions;
		} else {
			instructions
		}
	*/

	if(operation == '+') {
		writeln(a, operation, b, "=", a+b);
	} else if(operation == '-') {
		writeln(a, operation, b, "=", a-b);
	} else if(operation == '*') {
		writeln(a, operation, b, "=", a*b);
	} else if(operation == '/') {
		writeln(a, operation, b, "=", a/b);
	} else {
		writeln("Unknown operation! Error!");
	}

	/*
		== (is equal to), != (is not equal to), && (and), || (or)

		operation could either be '+' or '-'
		if(operation == '+' || operation == '-') { 
			instructions;
		}

		we check if both a and b are 0
		if(a == 0 && b == 0) {
			instructions;
		}
	*/
}



