module menu;

import data;

class Menu: IState {
	this() {}

	// inherited from IState interface
	void run() {
		writeln("*** menu state ***");
	}
}