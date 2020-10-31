module play;

import data;

class Play: IState {
	this() {}

	// inherited from IState interface
	void run() {
		writeln("*** play state ***");
	}
}