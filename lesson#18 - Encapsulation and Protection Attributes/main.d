import std.stdio;

import encap_protec_attrib;

void main() {
	// John's members can be freely accessed and modified
	Person John = Person("John", 35);
	writeln("Person: ", John.name, ", ", John.age);

	// Mary's members can be accessed through get... functions, but can't be modified
	Person2 Mary = Person2("Mary", 21);
	writeln("Person: ", Mary.name, ", ", Mary.age);				// ERROR! => no such property: name, age (because it's private)
	writeln("Person: ", Mary.getName(), ", ", Mary.getAge());		// works! => a copy/value is returned
}
