// Aliased and Public imports

// creating an alias io for std.stdio module
import io = std.stdio;

// creating an alias println for writeln function
import std.stdio: println = writeln;

// importing school and student
import school;

void main() {
	// calling writeln using io (std.stdio.writeln)
	io.writeln("Hello, World!\n");

	// println => writeln
	println("Using println alias (writeln);\n");		
	//writeln("Trying to call writeln.... oops..."); // error => writeln is undefined, println is defined

	// student is imported along with school, because => public import student
	Student Julia;
	School unknownSchool = School(Julia);
}
