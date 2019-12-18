//	IMPROVING OUR CALCULATOR
//	LEARN: functions, while loop, break statement

//	importing writeln, write and readf functions
import std.stdio: writeln, write, readf;

void main() {
	float a = 0;
	float b = 0;
	char operation; //	'+', '-', '*', '/'

	write("first number: ");
	readf(" %s", a);

	write("second number: "); 
	readf(" %s", b);

	write("operation: ");

	/*
		while(condition is true) { //	if condition is false, it will terminate the loop and continue down below
			repeat;
		}
	*/

	/*
	bool unknownOperation = true;
	while(unknownOperation) {
		readf(" %s", operation);

		if(operation == '+' || operation == '-' || 
			operation == '*' || operation == '/') {
			unknownOperation = false;
		} else {
			write("Error! Unknown operation. Try again: ");
		}
	}
	*/

	while(true) {
		readf(" %s", operation);

		if(operation == '+' || operation == '-' || 
			operation == '*' || operation == '/') {
			break;
		} else {
			write("Error! Unknown operation. Try again: ");
		}
	}

	float result = 0;
	if(operation == '+') {
		result = addition(a, b);
	} else if(operation == '-') {
		result = substraction(a, b);
	} else if(operation == '*') {
		result = multiplication(a, b);
	} else if(operation == '/') {
		result = division(a, b);
	}

	writeln(a, operation, b, "=", result);

	//	further instructions...
}

//	our functions

float addition(float a, float b) {
	return a+b;
}

float substraction(float a, float b) {
	return a-b;
}

float multiplication(float a, float b) {
	return a*b;
}

float division(float a, float b) {
	return a/b;
}

/*
	returnType functionName(parameterList) {
		instructions;
	}
	
	void

	Example:
	float addition(float a, float b) {
		float add = a + b;

		return add;
	}

	float addition(float a, float b) {
		return a+b;
	}
*/







