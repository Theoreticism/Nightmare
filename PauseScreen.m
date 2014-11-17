//
//  PauseScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "PauseScreen.h"
#import "MainScreen.h"

@implementation PauseScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct a pause screen and add it to the scene
    PauseScreen *layer = [PauseScreen node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init {
    if( (self=[super init]) ) {
        //Get the screen dimensions
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        [CCMenuItemFont setFontName:@"Xposed"];
        
        //Add the buttons to the menu
        
        CCMenuItem *resumeButton = [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(onResume:)];
        
        CCMenuItem *quitButton = [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        CCMenu *menu = [CCMenu menuWithItems:resumeButton, quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight* 0.25f)];
        
        //add the menu to the Layer
        [self addChild:menu];
    }
    
    return self;
}

/** Handles pressing the quit button*/
-(void) onResume:(CCMenuItemFont *)button {
    //return to game
}

/** Handles pressing the quit button*/
-(void) onQuit:(CCMenuItemFont *)button {
    //Might want to look into doing this a better way
    [[CCDirector sharedDirector] pushScene:[MainScreen scene]];
}

@end

