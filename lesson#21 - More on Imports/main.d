// Aliased and Public imports

import io = std.stdio;					// creating an alias io for std.stdio module
import std.stdio: println = writeln;	// creating an alias println for writeln function

import school;							// importing school and student

void main() {
	io.writeln("Hello, World!\n");		// calling writeln using io (std.stdio.writeln)

	println("Using println alias (writeln);\n");			// println => writeln
	//writeln("Trying to call writeln.... oops...");		// error => writeln is undefined, println is defined

	Student Julia;										// student is imported along with school, because => public import student
	School unknownSchool = School(Julia);
}