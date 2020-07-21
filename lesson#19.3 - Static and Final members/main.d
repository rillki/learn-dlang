import std.stdio: writeln;

class Data { 
	float x, y, width, height;
	int damage;

	// final functions cannot be overriden by a sublcass
	final float getRegenerationRate() {
		return damage*0.8f;
	}
}

class Enemy: Data {
	Data data;
	static int num;

	this() {
		writeln(num++);
	}

	~this() {
		writeln(--num);
	}

	static bool isColliding(/*Data data1, Data data2*/) {
		// collision logic
		return true;
	}

	//override float getRegenerationRate() {} // error!
}

void main() {
	Enemy e1 = new Enemy();
	Enemy e2 = new Enemy();
	Enemy e3 = new Enemy();
	
	// static members can be accessed directly by the class name without creating an instance of that class
	writeln("Number of enemies: ", Enemy.num, ".");
	writeln("Enemies colliding: ", Enemy.isColliding(/* any data of the same type*/));
}
