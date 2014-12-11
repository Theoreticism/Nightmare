//
//  HighScoreScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "MainScreen.h"
#import "HighScoresScreen.h"

/** HighScore screen layer which runs the high score menu */
@interface HighScoreScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Gets the array of scores */
+ (int) lowScore;

/** Gets a new list of scores */
+ (void) Update: (int) list;

/** Constructor for the quit screen*/
-(id) init;

/** Handles pressing the OK button*/
-(void) onOK: (CCMenuItemFont*) button;

@end
