//
//  Harpie.h
//  iMGABaseCC
//
//  Created by Ron Coleman on 12/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"

/** Horror enemy */
@interface Horror : Enemy {
    bool firstTime;
}

/** Constructor */
- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_;

/** Handles a collision event */
- (void) collisionEvent;
@end
