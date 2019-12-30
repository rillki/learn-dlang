import std.stdio: writeln; 		// input/output

import std.conv: to; 			// for converting one data type to another

import std.ascii: isDigit; 		// a library to work with unicode characters

void main() {
	int intNum = 42;
	double doubleNum = to!double(intNum);
	// doubleNum = intNum.to!double;

	writeln("intNum: ", intNum, " | doubleNum: ", doubleNum);

/*
	double dNum = 35.8;
	int iNum = dNum.to!int;

	writeln("iNum: ", iNum, " | dNum: ", dNum); */


/*	char c = '5';
	int a = c.to!int;
	writeln("a = ", a);

	a = to!int(c - '0');
	writeln("a = ", a); */


	checkIfDigit('5');
	checkIfDigit('A');
	checkIfDigit('/');
}

void checkIfDigit(char arg) {
	if(isDigit(arg)) {
		writeln("arg(", arg, ") is a digit!");
	} else {
		writeln("Error: arg(", arg, ") is undefined!");
	}
}