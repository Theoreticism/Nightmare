//
//  SkillLevelScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

static int def;

/** Skill level screen layer which runs the skill level menu */
@interface SkillLevelScreen : CCLayer {

}

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the SkillLevel screen*/
-(id) init;

/** Handles pressing the Back button*/
-(void) onBack: (CCMenuItemFont*) button;

/** Returns default lives value */
+(int) getDefault;

/** Handles pressing the Skill difficulty buttons*/
-(void) onBeginner: (CCMenuItemFont*) button;
-(void) onIntermediate: (CCMenuItemFont*) button;
-(void) onAdvanced: (CCMenuItemFont*) button;

@end