//
//  HighScoreScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "HighScoreScreen.h"
#import "HighScoresScreen.h"

@implementation HighScoreScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct a high score screen and adds it to the scene
    HighScoreScreen *layer = [HighScoreScreen node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init {
    if( (self=[super init]) ) {
        //Get the screen dimensions
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        [CCMenuItemFont setFontName:@"Xposed"];
        
        //Add the button to the menu
        CCMenuItem *OKButton = [CCMenuItemFont itemWithString:@"OK" target:self selector:@selector(onOK:)];
        
        CCMenu *menu = [CCMenu menuWithItems:OKButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight* 0.25f)];
        
        //add the menu to the Layer
        [self addChild:menu];
    }
    
    return self;
}

/** Handles pressing the OK button*/
-(void) onOK:(CCMenuItemFont *)button {
    //upload high score
    [[CCDirector sharedDirector] pushScene:[HighScoresScreen scene]];
}

@end

