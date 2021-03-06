import data;

class GStateManager {
    // private class instance
    private static GStateManager instance;
    
    // IState interface
    private IState state;

    // private constructor
    private this() { }

    // return the instance; create the instance, if it wasn't created yet
    static GStateManager getInstance() {
        if(instance is null) {
            instance = new GStateManager();
        }

        return instance;
    }

    // set game state
    void setState(IState state) {
        this.state = state;
    }

    // execute the current game state code
    void execute() {
        if(state is null) {
            return;
        }

        state.run();
    }
}












