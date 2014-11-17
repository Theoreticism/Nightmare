//
//  QuitScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "QuitScreen.h"

@implementation QuitScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct a quit screen and add it to the scene
    QuitScreen *layer = [QuitScreen node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init {
    if( (self=[super init]) ) {
        //Get the screen dimensions
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Are you sure?" fontName:@"Xposed" fontSize:64];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        label.position = ccp( size.width/2, size.height*0.65 );
        
        [self addChild: label];
        
        [CCMenuItemFont setFontName:@"Xposed"];
        
        //Add the buttons to the menu
        
        CCMenuItem *quitButton = [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems: backButton, quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight* 0.25f)];
        
        //add the menu to the Layer
        [self addChild:menu];
    }
    
    return self;
}

/** Handles pressing the quit button*/
-(void) onQuit:(CCMenuItemFont *)button {
    exit(0);
}

-(void) onBack: (CCMenuItemFont*)button {
    [[CCDirector sharedDirector] popScene];
}

@end

