module game.gstatemanager;

import game.data;

class GStateManager {
    // private class instance
    private static GStateManager instance;
    
    // IState interface
    private IState[GameState] state;
    
    // current game state 
    private GameState currGameState;

    // private constructor
    private this() { }

    // return the instance; create the instance, if it wasn't created yet
    static GStateManager getInstance() {
        if(instance is null) {
            instance = new GStateManager();
        }

        return instance;
    }

    // add game state
    void add(IState state, GameState gs) {
        this.state[gs] = state;
    }

    // remove game state
    void remove(GameState gs) {
        this.state.remove(gs);
    }

    // set game state
    void setState(GameState gs) {
        currGameState = gs;
    }

    // return the current game state
    GameState getState() {
        return currGameState;
    }

    // execute the current game state code
    void execute() {
        if(state is null) {
            return;
        }

        state[currGameState].run();
    }
}
