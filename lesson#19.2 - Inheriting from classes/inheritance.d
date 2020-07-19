module inheritance;

// ****** Inheriting from Classes: Implementation Inheritance  ******
import std.stdio: writeln;

class Person {
	string id;

	void speak() {
		writeln("Hello, world!");
	}
}

class John: Person {
	// inherits: string id;

	this(string s) {
		id = s; 
	}

	// redifining the inherited speak function of Person
	override void speak() {
		super.speak();	// calling the default(Person's) speak function
		writeln("Hi! My id is: ", id, ".");
	}
}

class Anna: Person {
	// inherits: string id;

	this(string s) {
		id = s; 
	}

	// Anna inherits the default implementation
}










