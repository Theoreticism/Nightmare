//
//  QuitScreen.h
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

/** Quit screen layer which runs the quit menu */
@interface QuitScreen : CCLayer

/** Gets a scene to contain this layer */
+(CCScene *) scene;

/** Constructor for the quit screen*/
-(id) init;

/** Handles pressing the quit button*/
-(void) onQuit: (CCMenuItemFont*) button;

@end
