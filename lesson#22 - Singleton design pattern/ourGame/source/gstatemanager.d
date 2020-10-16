import data;

class GStateManager {
    private static GStateManager instance;

    private this() { }

    static GStateManager getInstance() {
        if(instance is null) {
            instance = new GStateManager();
        }

        return instance;
    }

    void hello_world() {
        writeln("Hello World!");
    }
}
