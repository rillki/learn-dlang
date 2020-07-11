module inheritance; 

// ****** interfaces ******
// 1) its member functions are abstract (have no implementation)
// 2) interfaces can inherit only form other interfaces
// 3) inheritance syntax => interface/class Name: Inherit_Name {}

interface IAnimal {
	void makeSound(); 	// abstract function ('abstract' keyword could be used in a class to achieve the same functionality)
	// ...

	//static/final type name() { ... } 	// static and final members do have an implementation, are inherited, and cannot be overriden
}

// ****** inheritance ******
// 1) interfaces can inherit only from other interfaces
// 2) classes can inherit from multiple interfaces
// 3) interface members must be implemented, unless they are static or final

class Cat: IAnimal { 	// Cat inherits from IAnimal interface
	this() { }

	void makeSound() { 	// implements makeSound function
		import std.stdio: writeln;

		writeln("Meow...");
	}
}

//--------------------------//

class Dog: IAnimal { 	// Dog inherits from IAnimal interface
	this() { }

	void makeSound() { 	// implements makeSound function
		import std.stdio: writeln;

		writeln("Woof woof...");
	}
}

class Cow: IAnimal { 	// Cow inherits from IAnimal interface
	this() { }

	void makeSound() { 	// implements makeSound function
		import std.stdio: writeln;

		writeln("Moooo...");
	}
}








