import std.stdio: writeln;

void pointers() {
	int myVariable = 120;
	int* myPointer = &myVariable;

	/*
		Valid pointer declarations:
			type* name;
			type * name;
			type *name;
	*/

	writeln("Memory address of myVariable:\t", &myVariable);
	writeln("Value of myPointer:\t\t", myPointer);

	writeln("\nValue of myVariable: ", myVariable);
	writeln("Value of myVariable accessed through my Pointer: ", *myPointer);

	*myPointer += 5;	// modifies the value of myVariable
	// myPointer += 5;	// !!! modifies the address myPointer points at by sizeof(int)*5

	writeln("\n| *myPointer += 5 |\t => myVariable: ", myVariable);

	myPointer = null;

	/*

	// increments the value of a copy
	void increment(int num) {
		num += 1;				
	}

	// increments the actual value of the variable
	void increment(ref int num) {
		num += 1;
	}
	
	// increments the actual value of the variable
	void increment(int* num) {
		*num += 1;
		// num += 1; 	// modifying the address
	}

	*/
}


void gc_allocations() /*  @nogc  */{
	import core.memory: GC;

	/**** GC basics ****/
	// disabling GC collection cycles | it does not gurantee, that GC cycles won't be run
	// GC cycle will be run anyway, if more memory is required
	GC.disable(); 

	// enabling GC collection cycles
	GC.enable();

	// explicitly starting a GC collection cycle
	GC.collect();


	int* var1 = new int; 		// allocating an int on GC heap
	int[] var2 = new int[42];	// allocating a dynamic array of 42 ints on GC heap
	var2 ~= 2;

	// allocating a fixed size array on the GC heap
	//int* var3 = cast(int*)GC.malloc(int.sizeof * 42);
	//int* var3 = cast(int*)GC.realloc(null, int.sizeof * 42);
	int* var3 = cast(int*)GC.calloc(int.sizeof * 42);

	GC.free(var3);
}

void stdc_allocations() {
	import core.stdc.stdlib: malloc, free; // malloc, realloc, etc... from C stdlib
	import core.memory: GC;

	int size = 42;

	// allocating memory the C-way
	int* var = cast(int*)malloc(int.sizeof * size);

	// (*) optional: adding var to GC memory
	GC.addRange(var, size);

	// ...........

	// if (*), then var should be removed before freeing 
	GC.removeRange(var);

	// freeing var
	free(var);
}

void main() {
	pointers();
	gc_allocations();
	stdc_allocations();
}





























