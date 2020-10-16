import data;

class GStateManager {
    // private class instance
    private static GStateManager instance;

    // private constructor
    private this() { }

    // return the instance; create the instance, if it wasn't created yet
    static GStateManager getInstance() {
        if(instance is null) {
            instance = new GStateManager();
        }

        return instance;
    }

    // dummy function for testing purposes
    void hello_world() {
        writeln("Hello World!");
    }
}
