module data;

// mostly used libraries
public import raylib;
public import std.stdio: writeln, write;

// window dimensions
immutable windowWidth = 720;
immutable windowHeight = 640;

// Game states
enum GameState {
    MainMenu,
    Play,
    Exit
}

// state interface
interface IState {
    void run();
}


