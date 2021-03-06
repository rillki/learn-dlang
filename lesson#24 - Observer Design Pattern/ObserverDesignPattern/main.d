import std.stdio: writeln;

interface IObserver {
	void update(string msg);
}

class WhatsApp {
	private IObserver[] list;

	this() {}
	~this() {}

	void addClient(IObserver o) {
		list ~= o;
	}

	void removeClient(IObserver o) {
		import std.algorithm: remove;
		list = list.remove!(a => a is o);
	}

	void notify(string msg) {
		foreach(client; list) {
			client.update(msg);
		}
	}
}

class Person: IObserver {
	string name;

	this(string name) {
		this.name = name;
	}

	void update(string msg) {
		writeln(name, "\t: notified. [", msg, "]");
	}
}

void main() {
	WhatsApp app = new WhatsApp();

	Person anna = new Person("Anna");
	Person john = new Person("John");
	Person markus = new Person("Markus");

	app.addClient(anna);
	app.addClient(john);
	app.addClient(markus);

	app.notify("hello, world!");

	app.removeClient(john);

	app.notify("john left the conversation");
}










