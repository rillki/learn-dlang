import std.stdio: writeln;

// classes are a reference type, structs are a value type
class Hello {
	string name;

	this(string s) {
		name = s;
	}

	void print() {
		writeln("hello, ", name, "!");
	}

	// a func for copying an object
	Hello dup() {
		return new Hello(name);
	}
}

void main() {
	// class initialization
	Hello hello = new Hello("John"); 	// use -vgc flag to display GC allocations

	// allocating on the stack using "scope" keyword
	//scope Hello hello = new Hello("John");

	if(hello is null) {
		writeln("Error! Could not initialize hello!");
		return;
	}

	/*  scope(...) { ... } expressions:
			scope(success) { ... } 	=>	is executed if the scope exits successfully
			scope(failure) { ... }	=>	is executed if the scope exits due to an exception
			scope(exit) { ... }		=>	is executed regardless of the previous two cases
	*/

	scope(exit) {
		writeln("goodbuy...");
	}

	hello.print();

	// making a reference
	Hello ref_hello = hello;

	// making a copy
	Hello copy_hello = hello.dup();
}













