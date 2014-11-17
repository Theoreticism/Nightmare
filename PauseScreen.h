//
//  PauseScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

/** Pause screen layer which runs the pause menu */
@interface PauseScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the quit screen*/
-(id) init;

/** Handles pressing the pause button*/
-(void) onResume: (CCMenuItemFont*) button;

/** Handles pressing the quit button*/
-(void) onQuit: (CCMenuItemFont*) button;

@end
