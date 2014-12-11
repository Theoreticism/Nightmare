//
//  Level3.h
//  Nightmare
//
//  Created by Marist User on 12/8/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Level2.h"

@interface Level3 : Level2 {
    CCTMXLayer* weaponsLayer;
    CCLabelTTF* gotWeapon;
}

/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Updates the level */
- (void) update:(ccTime)dt;

/** Handles PC-weapons collisions */
- (void) handlePCWeaponCollision;

@end
