module game.player;

import game.data;

class Player: Entity {
	this(in Texture2D texture, in Rectangle frame, in Vector2 position) {
		super(texture, frame, position);
	}
	
	override void update() {}
	override void processEvents() {}
}








