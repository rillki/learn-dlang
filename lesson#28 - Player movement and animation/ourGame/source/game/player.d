module game.player;

import game.data;
import game.animation.animation;
import game.animation.manager;

class Player: Entity {
    private int playerSpeed;
    private AnimationManager animation;

    this(in Texture2D texture, in Rectangle frame, in Vector2 position, in int playerSpeed) {
        super(texture, frame, position);
        this.playerSpeed = playerSpeed;

        animation = AnimationManager();
        animation.addAnimation(KeyboardKey.KEY_NULL, Animation(texture, 8, 3, 0.1f, 1));
        animation.addAnimation(KeyboardKey.KEY_W, Animation(texture, 8, 3, 0.1f, 3));
        animation.addAnimation(KeyboardKey.KEY_S, Animation(texture, 8, 3, 0.1f, 2));
        animation.addAnimation(KeyboardKey.KEY_A, Animation(texture, 8, 3, 0.1f, 2));
        animation.addAnimation(KeyboardKey.KEY_D, Animation(texture, 8, 3, 0.1f, 3));
    }
    
    override void update() {}

    override void processEvents() {
        if(IsKeyDown(KeyboardKey.KEY_W)) {
            move(0, -playerSpeed);
            animation.update(KeyboardKey.KEY_W);
        } else if(IsKeyDown(KeyboardKey.KEY_S)) {
            move(0, playerSpeed);
            animation.update(KeyboardKey.KEY_S);
        } else if(IsKeyDown(KeyboardKey.KEY_A)) {
            move(-playerSpeed, 0);
            animation.update(KeyboardKey.KEY_A);
        } else if(IsKeyDown(KeyboardKey.KEY_D)) {
            move(playerSpeed, 0);
            animation.update(KeyboardKey.KEY_D);
        } else {
            animation.update(KeyboardKey.KEY_NULL);
        }
    }

    override void draw() {
        animation.draw(position);
    }
}








