module game.animation;

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

    this(const ref Texture2D texture, const int numFrames, const int numVerticalFrames, const float frameTimeSecs, const int row = 1) {
        this.texture = texture;
        this.numFrames = numFrames;
        this.frameTimeSecs = frameTimeSecs;
        this.frameTimeSecsLeft = frameTimeSecs;
        this.currentFrame = 0;
        this.isActive = true;

        // create rectangle frames
        immutable frameWidth = texture.width / numFrames;
        immutable frameHeight = texture.height / numVerticalFrames;
        foreach(i; 0 .. numFrames) {
            this.rectFrames ~= Rectangle(i * frameWidth, (row - 1) * frameHeight, frameWidth, frameHeight);
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
        if(frameTimeSecsLeft < 0) {
            frameTimeSecsLeft += frameTimeSecs;
            currentFrame = (currentFrame + 1) % numFrames;
        }
    }

    void draw(const Vector2 position) {
        DrawTextureRec(texture, rectFrames[currentFrame], position, Colors.WHITE);
    }
}


