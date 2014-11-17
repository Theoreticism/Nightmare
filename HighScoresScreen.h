//
//  AudioScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

/** High scores screen layer which runs the High scores menu */
@interface HighScoresScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the HighScores screen*/
-(id) init;

/** Handles pressing the Back button*/
-(void) onQuit: (CCMenuItemFont*) button;

/** Handles pressing the Online button*/
-(void) onOnline: (CCMenuItemFont*) button;

/** Handles pressing the Locally button*/
-(void) onLocally: (CCMenuItemFont*) button;

@end