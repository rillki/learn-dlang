module game.animationmanager;

import raylib;
import game.animation;

struct AnimationManager {
    private Animation[KeyboardKey] animations;
    private KeyboardKey lastKey;

    void addAnimation(KeyboardKey key, Animation animation) {
        animations[key] = animation;
        lastKey = key;
    }

    void update(KeyboardKey key) {
        if(key in animations) {
            animations[key].start();
            animations[key].update();
            lastKey = key;
        } else {
            animations[lastKey].stop();
            animations[lastKey].reset();
        }
    }

    void draw(const Vector2 position) {
        animations[lastKey].draw(position);
    }
}