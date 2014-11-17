//
//  OptionsScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

/** Options screen layer which runs the options menu */
@interface OptionsScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the options screen*/
-(id) init;

/** Handles pressing the Audio button*/
-(void) onAudio : (CCMenuItemFont*) button;

/** Handles pressing the Skill level button*/
-(void) onSkillLevel: (CCMenuItemFont*) button;

/** Handles pressing the High scores button*/
-(void) onHighScores: (CCMenuItemFont*) button;

/** Handles pressing the Back button*/
-(void) onBack: (CCMenuItemFont*) button;

@end