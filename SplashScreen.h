//
//  SplashScreen.h
//  Nightmare
//
//  Created by Chris Lee on 11/13/14.
//  Copyright 2014 Chris Lee and Michael McElligott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

// Splash screen
@interface SplashScreen : CCLayer {
    BOOL started;
}

// Gets a scene for this layer
+ (CCScene*) scene;

// Make automatic transition to the main screen
- (void) makeTransition:(ccTime) dt;

// Makes transition to main screen on button click
- (void) onGo: (CCMenuItemFont*) button;

@end
