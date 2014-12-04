//
//  HighScoreScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "HighScoreScreen.h"
#import "HighScoresScreen.h"

static int arr[] = { 0, 0, 0};

@implementation HighScoreScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct a high score screen and adds it to the scene
    HighScoreScreen *layer = [HighScoreScreen node];
    
    [scene addChild: layer];
    
    return scene;
}

/** returns the lowest score*/
+ (int) lowScore {
    return arr[2];
}

/** Gets a new list of scores */
+ (void) Update: (int[]) list {
    arr[0] = list[0];
    arr[1] = list[2];
    arr[2] = list[2];
}

-(id) init {
    if( (self=[super init]) ) {
        //Get the screen dimensions
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        NSString* title = @"High Scores!";
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:title fontName:@"Xposed" fontSize:56];
        
        // position the label on the center of the screen
		label.position =  ccp( screenWidth /2 , screenHeight /1.2f);
        
        label.color = ccc3(255,0,0);
        
        [self addChild:label];
        
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
    //return to main menu
    [[CCDirector sharedDirector] pushScene:[MainScreen scene]];
}

@end

