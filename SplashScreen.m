//
//  SplashScreen.m
//  Nightmare
//
//  Created by Chris Lee on 11/13/14.
//  Copyright 2014 Chris Lee and Michael McElligott. All rights reserved.
//

#import "SplashScreen.h"
#import "MainScreen.h"

@implementation SplashScreen

+ (CCScene *) scene {
    
    // scene is an autorelease object
    CCScene* scene = [CCScene node];
    
    // layer is an autorelease object
    SplashScreen *layer = [SplashScreen node];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
    
}

- (id) init {
    if ((self = [super init])) {
        started = false;
        
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCSprite* logo = [CCSprite spriteWithFile: @"Nightmare.png"];
        
        [logo setPosition:ccp(screenWidth/2, screenHeight*0.65)];
        
        [self addChild:logo];
        
        [CCMenuItemFont setFontName:@"Xposed"];
        
//        CCMenuItem *goButton = [CCMenuItemFont itemWithString:@"Go" target:self selector:@selector(onGo)];
        
//        CCMenu *menu = [CCMenu menuWithItems:goButton, nil];
        
//        [menu setPosition:ccp(screenWidth/2, screenHeight*0.40)];
        
//        [self addChild:menu];
        
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(makeTransition:) userInfo:nil repeats:NO];
        
    }
    return self;
}

- (void) makeTransition:(ccTime)dt {
    if(started)
        return;
    
    started = true;
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.50f scene:[MainScreen scene] withColor:ccWHITE]];
}

- (void) onGo: (CCMenuItemFont*) button {
    if (started)
        return;
    
    [self makeTransition: 0];
}

@end
