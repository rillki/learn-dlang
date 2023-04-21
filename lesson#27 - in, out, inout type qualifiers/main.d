module main;

import std.stdio;

void main() {
    int kg = 5;
    int g = kg2g(kg);

    writeln("kg: ", kg);
    writeln(" g: ", g);

    // --- --- ---
    writeln("--- --- ---"); 
    
    int remainder = 0;
    int result = divide(10, 4, remainder);
    
    writeln("   result: ", result);
    writeln("remainder: ", remainder);

    // --- --- --- 
    writeln("--- --- ---"); 

    int[] array = [1, 2, 3, 4];
    const int[] constArray = [5, 6, 7, 8];
    immutable int[] immutableArray = [9, 10, 11, 12];

    int[] arrayResult = doSomething(array);
    const int[] constArrayResult = doSomething(constArray);
    immutable int[] immutableArrayResult = doSomething(immutableArray);
    
    int[] arr = doSomething(constArray); // error! cannot do implicit conversion between type qualifiers
    // Error: cannot implicitly convert expression `doSomething(constArray)` of type `const(int)[]` to `int[]`

    writeln(" a: ", arrayResult);
    writeln("ca: ", constArrayResult);
    writeln("ia: ", immutableArrayResult);
}

/// kilogram to gram converter
int kg2g(in int kg) {
    // kg = 2; // error, cannot modify, read-only

    int g = kg * 1000;
    return g;
}

/// division and calculates remainder
int divide(in int value, in int divisor, out int remainder) {
    assert(remainder == int.init); // remainder is for output, it is initialized to 0

    // calculate
    remainder = value % divisor;
    int result = value / divisor;

    return result;
}

/// imagine it does something useful
inout(int)[] doSomething(inout(int)[] values) {
    // do some work
    return values;
}



