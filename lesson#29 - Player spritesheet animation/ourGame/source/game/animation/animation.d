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
        bool flip;
    }

    this(in Texture2D texture, in int numFrames, in int numRows, in float frameTimeSecs, in int useRow = 1, in bool flip = false) {
        this.texture = texture;
        this.numFrames = numFrames;
        this.frameTimeSecs = frameTimeSecs;
        this.frameTimeSecsLeft = frameTimeSecs;
        this.currentFrame = 0;
        this.isActive = true;
        this.flip = flip;

        // create rectangle frames
        immutable frameWidth = texture.width / numFrames;
        immutable frameHeight = texture.height / numRows;
        foreach(i; 0 .. numFrames) {
            this.rectFrames ~= Rectangle(i * frameWidth, (useRow - 1) * frameHeight, frameWidth, frameHeight);
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
        if (flip) {
            DrawTextureRec(texture, 
                Rectangle(
                    rectFrames[currentFrame].x, 
                    rectFrames[currentFrame].y, 
                    -rectFrames[currentFrame].width, 
                    rectFrames[currentFrame].height
                ), 
            position, Colors.WHITE);
        } else {
            DrawTextureRec(texture, rectFrames[currentFrame], position, Colors.WHITE);
        }
    }
}


