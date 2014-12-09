//
//  Level2.h
//  Nightmare
//
//  Created by Christopher Lee and Michael McElligott on 12/8/14.
//  Copyright 2014 Christopher Lee and Michael McElligott. All rights reserved.
//

#import "Level1.h"

/* Level 2 handles obstacles and insanity fragments */
@interface Level2 : Level1 {
    CCTMXLayer* obstaclesLayer;
    CCTMXLayer* insanityLayer;
}

/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Updates the level */
- (void) update:(ccTime)dt;

/** Handles PC-obstacle collisions */
- (void) handlePCObstacleCollision;

@end
