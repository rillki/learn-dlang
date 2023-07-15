module game.entity.player;

import game.data;
import game.animation.animation;
import game.animation.manager;

class Player: Entity {
    private int movementSpeed;
    private AnimationManager animationManager;

    this(in Texture2D texture, in Rectangle frame, in Vector2 position, in int movementSpeed = 5) {
        super(texture, frame, position);

        this.movementSpeed = movementSpeed;
        animationManager.add(KeyboardKey.KEY_NULL, Animation(texture, 6, 5, 0.15, 1));
        animationManager.add(KeyboardKey.KEY_W, Animation(texture, 6, 5, 0.1, 5));
        animationManager.add(KeyboardKey.KEY_S, Animation(texture, 6, 5, 0.1, 5));
        animationManager.add(KeyboardKey.KEY_A, Animation(texture, 6, 5, 0.1, 5, true));
        animationManager.add(KeyboardKey.KEY_D, Animation(texture, 6, 5, 0.1, 5));
        animationManager.add(KeyboardKey.KEY_SPACE, Animation(texture, 6, 5, 0.12, 2));
        animationManager.add(KeyboardKey.KEY_X, Animation(texture, 6, 5, 0.1, 3));
        animationManager.add(KeyboardKey.KEY_Z, Animation(texture, 6, 5, 0.13, 4));
    }
    
    override void update() {}

    override void processEvents() {
        if (IsKeyDown(KeyboardKey.KEY_W)) {
            this.move(0, -movementSpeed);
            animationManager.update(KeyboardKey.KEY_W);
        } else if (IsKeyDown(KeyboardKey.KEY_S)) {
            this.move(0, movementSpeed);
            animationManager.update(KeyboardKey.KEY_S);
        } else if (IsKeyDown(KeyboardKey.KEY_A)) {
            this.move(-movementSpeed, 0);
            animationManager.update(KeyboardKey.KEY_A);
        } else if (IsKeyDown(KeyboardKey.KEY_D)) {
            this.move(movementSpeed, 0);
            animationManager.update(KeyboardKey.KEY_D);
        } else if (IsKeyDown(KeyboardKey.KEY_SPACE)) {
            //
            animationManager.update(KeyboardKey.KEY_SPACE);
        } else if (IsKeyDown(KeyboardKey.KEY_X)) {
            animationManager.update(KeyboardKey.KEY_X);
        } else if (IsKeyDown(KeyboardKey.KEY_Z)) {
            animationManager.update(KeyboardKey.KEY_Z);
        } else {
            animationManager.update(KeyboardKey.KEY_NULL);
        }
    }

    override void draw() {
        animationManager.draw(position);
    }
}

