module encap_protec_attrib;

// ***** public by default ******
// => can be both accessed and modified
struct Person {
	string name;	// or => public string name;
	int age;
}

// ****** private members ****** 
// => cannot be modified, but can be accessed through get... functions
struct Person2 {
	private string name;
	private int age;

	string getName() {
		return name;
	}

	int getAge() {
		return age;
	}
}

// specifying protection attributes at a modular level
private void foo() { /* or struct/class/etc */ }

// ****** package protection attribute ******
// animal.cat contains: package void foo() { ... }
// it can be accessed in any other module inside the animal package

// ****** protected members ****** 
// => can be accessed by the module that defines it and by any class that inherits from it
class Person3 {
	string name;
	int age;

	protected int id;

	// this(...) { ... }
	// ...
}



// ****** defining protection attribtes ****** 

// 1) java style
private void hello() { }

// 2) c++ style
public:
	void hello() { }
	// ....

// 3) block style
protected {
	void hello() { }	
}





