//
//  AudioScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

/** Audio screen layer which runs the options menu */
@interface AudioScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the Audio screen*/
-(id) init;

/** Handles pressing the Back button*/
-(void) onBack: (CCMenuItemFont*) button;

/** Handles pressing the Sounds On button*/
-(void) onSoundsOn: (CCMenuItemFont*) button;

/** Handles pressing the Sounds Off button*/
-(void) onSoundsOff: (CCMenuItemFont*) button;

@end