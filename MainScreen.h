//
//  MainScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

/** Main screen layer which runs the main menu */
@interface MainScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the main screen*/
-(id) init;

/** Handles pressing the start button*/
-(void) onNew : (CCMenuItemFont*) button;

/** Handles pressing the resume button*/
-(void) onResume: (CCMenuItemFont*) button;

/** Handles pressing the options button*/
-(void) onOptions: (CCMenuItemFont*) button;

/** Handles pressing the quit button*/
-(void) onQuit: (CCMenuItemFont*) button;

@end
