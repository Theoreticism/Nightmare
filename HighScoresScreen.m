//
//  HighScoresScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "HighScoresScreen.h"
#import "MainScreen.h"

@implementation HighScoresScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct a High score screen and add it to the scene
    HighScoresScreen *layer = [HighScoresScreen node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init {
    if( (self=[super init]) ) {
        //Get the screen dimensions
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        //Add label asking to save highscore online or locally
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Save High Score?" fontName:@"Xposed" fontSize:32];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        label.position = ccp( size.width/2, size.height*0.65 );
        
        [self addChild:label];
        
        [CCMenuItemFont setFontName:@"Xposed"];
        
        //Add the buttons to the menu
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        CCMenuItem *onlineButton = [CCMenuItemFont itemWithString:@"Online" target:self selector:@selector(onOnline:)];
        
        CCMenuItem *localButton = [CCMenuItemFont itemWithString:@"Locally" target:self selector:@selector(onLocally:)];
        
        CCMenu *menu = [CCMenu menuWithItems: onlineButton, localButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight* 0.25f)];
        
        //add the menu to the Layer
        [self addChild:menu];
    }
    
    return self;
}

-(void) onQuit: (CCMenuItemFont *)button {
    [[CCDirector sharedDirector] pushScene:[MainScreen scene]];
}

-(void) onOnline:(CCMenuItemFont *)button {
    //Do nothing yet
}

-(void) onLocally:(CCMenuItemFont *)button {
    //Do nothing yet
}

@end