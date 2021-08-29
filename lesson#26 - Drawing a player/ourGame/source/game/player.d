module game.player;

import game.data;

class Player: Entity {
	this(const ref Texture2D texture, const Rectangle frame, const Vector2 position) {
		super(texture, frame, position);
	}
	
	override void update() { }
}








