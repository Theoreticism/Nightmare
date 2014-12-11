//
//  Level0.h
//  iMGABaseCC
//
//  Created by Ron Coleman on 12/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AbstractLevel.h"
#import "Player.h"
#import "Goal.h"

#define RID_NO_TILE 0
#define RID_WALL 1
#define RID_PLAYER 2
#define RID_SHADOW 3
#define RID_HORROR 4
#define RID_GOAL 17
#define RID_ENEMY_BLOCK 19
#define RID_THOUGHT_FRAGMENT 5
#define RID_INSANITY_FRAGMENT 6
#define RID_GROUND 9
#define RID_OBSTACLE 11
#define RID_WEAPON 7

/** Level 0 handles the goal, rewards and scrolling */
@interface Level0 : AbstractLevel {
    int count;
    bool caught;
	bool complete;
	int thoughtFragCount;

	Goal* goal;
	Player* player;
    CCTMXLayer* rewardsLayer;

}

/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Updates the level */
- (void) update:(ccTime)dt;

/** Scrolls in x and y directions */
- (void) scroll;

/** Scrolls in the x direction only */
- (void) scrollX;

/** Scrolls in the y direction only */
- (void) scrollY;

/** Overrides CCLayer method so as to handle retina displays. */
- (void) setPosition:(CGPoint)position;

/** Handles PC-rewards collisions */
- (void) handlePCRewardCollision;

/** Handles PC-goal collisions */
- (void) handlePCGoalCollision;

/** Returns true if the GID is a ladda type */
- (bool) isLadda:(int) gid;

/** Returns true if the GID is a platform type */
- (bool) isPlatform:(int) gid;
@end
