//
//  GameOverScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "MainScreen.h"
#import "HighScoreScreen.h"

/** GameOver screen layer which runs the GameOver menu */
@interface GameOverScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the quit screen*/
-(id) init;

/** Handles pressing the OK button*/
-(void) onContinue: (CCMenuItemFont*) button;

@end
