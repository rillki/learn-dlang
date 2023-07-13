module game.animation.animation;

import raylib;

struct Animation {
    private {
        Texture2D texture;
        Rectangle[] rectFrames;
        int numFrames;
        int currentFrame;
        float frameTimeSecs;
        float frameTimeSecsLeft;
        bool isActive;
    }

    this(in Texture2D texture, in int numFrames, in float frameTimeSecs) {
        this.texture = texture;
        this.numFrames = numFrames;
        this.frameTimeSecs = frameTimeSecs;
        this.frameTimeSecsLeft = frameTimeSecs;
        this.currentFrame = 0;
        this.isActive = true;

        // create rectangle frames
        immutable frameWidth = texture.width / numFrames;
        immutable frameHeight = texture.height;
        foreach(i; 0 .. numFrames) {
            this.rectFrames ~= Rectangle(i * frameWidth, frameHeight, frameWidth, frameHeight);
        }
    }
    
    void start() {
        isActive = true;
    }

    void stop() {
        isActive = false;
    }

    void reset() {
        currentFrame = 0;
        frameTimeSecsLeft = frameTimeSecs;
    }

    void update() {
        if(!isActive) {
            return;
        }

        frameTimeSecsLeft -= GetFrameTime();
        if(frameTimeSecsLeft <= 0) {
            frameTimeSecsLeft += frameTimeSecs;
            currentFrame = (currentFrame + 1) % numFrames;
        }
    }

    void draw(in Vector2 position) {
        DrawTextureRec(texture, rectFrames[currentFrame], position, Colors.WHITE);
    }
}


