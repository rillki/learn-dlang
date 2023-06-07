module game.animation.manager;

import raylib;
import game.animation.animation;

struct AnimationManager {
    private Animation[KeyboardKey] animations;
    private KeyboardKey lastKey;

    void addAnimation(in KeyboardKey key, Animation animation) {
        animations[key] = animation;
        lastKey = key;
    }

    void update(in KeyboardKey key) {
        if(key in animations) {
            animations[key].start();
            animations[key].update();
            lastKey = key;
        } else {
            animations[lastKey].stop();
            animations[lastKey].reset();
        }
    }

    void draw(in Vector2 position) {
        animations[lastKey].draw(position);
    }
}