import std.stdio: writeln;

// IObserver interface
interface IObserver {
    void update(string msg);
}
// Person (observer)
class Person: IObserver {
    string name;

    this(string name) {
	this.name = name;
    }

    void update(string msg) {
	writeln(name, "\t: notified. [", msg, "]");
    }
}

// WhatsApp (subject)
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

void main() {
    WhatsApp conversation = new WhatsApp();

    Person anna = new Person("Anna");
    Person john = new Person("John");
    Person markus = new Person("Markus");
    
    conversation.addClient(anna);
    conversation.addClient(john);
    conversation.addClient(markus);

    conversation.notify("hello, world!");

    conversation.removeClient(john);
    
    conversation.notify("john left the conversation");
}






