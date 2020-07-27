// ****** this, alias, alias ... this keywords  ******

// Converting Celcius to Fahrenheit
class CelciusToFahrenheit {
	float celcius;
	
	// init
	this(float celcius) {
		this.celcius = celcius;
	}

	// convert to Fahrenheit
	double convert() {
		return double(9.0/5.0 * celcius + 32.0);
	}
	
	// enable automatic conversion of CelciusToFahrenheit objects to double
	alias convert this;
}

// print temperature announcement for the day
void announce(string day, double temp) {
	import std.stdio: writeln;
	
	writeln("Temperature for ", day, " is ", temp, "F.");
}

void main() {
	CelciusToFahrenheit monday = new CelciusToFahrenheit(36.0);
	announce("Monday", monday);
	
	// creating an alias of CelciusToFahrenheit class	
	// similar to 'typedef' in C, 'using' in C++11
	alias CtoF = CelciusToFahrenheit; // also: alias CelciusToFahrenheit CtoF;

	CtoF tuesday = new CtoF(24.5);
	announce("Tuesday", tuesday);

	// imitating rust's data types:
	alias u8 = ubyte;
	alias u16 = ushort;
	alias u32 = uint;
	alias f32 = float;
	alias f64 = double;
	// etc...
}
