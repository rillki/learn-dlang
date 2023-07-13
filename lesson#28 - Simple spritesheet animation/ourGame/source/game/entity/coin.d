module game.entity.coin;

import game.data;
import game.animation.animation;

class Coin: Entity {
    private {
        Animation animation;
    }

    this(in Texture2D texture, in Rectangle frame, in Vector2 position) {
        super(texture, frame, position);
        
        animation = Animation(texture, 5, 0.1);
    }
    
    override void update() {
        animation.update();
    }

    override void processEvents() {}

    override void draw() {
        animation.draw(position);
    }
}

