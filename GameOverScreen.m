//
//  GameOverScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "GameOverScreen.h"

@implementation GameOverScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct a gameOver screen and add it to the scene
    GameOverScreen *layer = [GameOverScreen node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init {
    if( (self=[super init]) ) {
        //Get the screen dimensions
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Game Over!" fontName:@"Xposed" fontSize:56];
        label.position = ccp( screenWidth / 2, screenHeight / 2 );
        label.color = ccc3(255, 0, 0);
        [self addChild:label];
        
        //Add the buttons to the menu
        
        [CCMenuItemFont setFontName:@"Xposed"];
        
        CCMenuItem *continueButton = [CCMenuItemFont itemWithString:@"Continue" target:self selector:@selector(onContinue:)];
        
        CCMenu *menu = [CCMenu menuWithItems:continueButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight* 0.25f)];
        
        //add the menu to the Layer
        [self addChild:menu];
    }
    
    return self;
}

/** Handles pressing the OK button*/
-(void) onContinue:(CCMenuItemFont *)button {
    //check current High Score
    //if greater
    //[[CCDirector sharedDirector] pushScene:[HighScoreScreen scene]];
    //else
    [[CCDirector sharedDirector] pushScene:[MainScreen scene]];
}

@end

