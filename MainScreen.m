//
//  MainScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "MainScreen.h"
#import "QuitScreen.h"
#import "OptionsScreen.h"
#import "AppDelegate.h"
#import "InterLevel.h"

@implementation MainScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct a main screen and add it to the scene
    MainScreen *layer = [MainScreen node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init {
    if( (self=[super init]) ) {
        //Get the screen dimensions
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        //Add the logo
        /**CCSprite* logo = [[CCSprite node] initWithFile:@"Nightmare-logo2.png"];
         
         [logo setPosition:ccp(screenWidth/2.0, screenHeight * 0.65f)];
         
         [self addChild:logo];
         */
        
        //Create and initialize a label
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Nightmare" fontName:@"Xposed" fontSize:64];
        
        // ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        // position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height*0.65 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        [CCMenuItemFont setFontName:@"Xposed"];
        
        //Add the buttons to the menu
        CCMenuItem *newButton = [CCMenuItemFont itemWithString:@"New" target:self selector:@selector(onNew:)];
        
        CCMenuItem *resumeButton = [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(onResume:)];
        
        CCMenuItem *optionsButton = [CCMenuItemFont itemWithString:@"Options" target:self selector:@selector(onOptions:)];
        
        CCMenuItem *quitButton = [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        /**
         //if there is a current game
         CCMenu *menu = [CCMenu menuWithItems:newButton, resumeButtom, optionsButton, quitButton, nil];
         */
        
        CCMenu *menu = [CCMenu menuWithItems:/*resumeButton,*/ newButton, optionsButton, quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight* 0.25f)];
        
        //add the menu to the Layer
        [self addChild:menu];
    }
    
    return self;
}

- (void) onNew: (CCMenuItemFont*) button {
    //does nothing right now, still need to add gameScreen
    /**
     [[CCDirector sharedDirector] pushScene:[[CCTransitionRotoZoom transitionWithDuration:2.0 scene: [GameScreen scene]];
     */
    [[CCDirector sharedDirector] pushScene:[InterLevel scene]];
}

/** Handles pressing the resume button*/
-(void) onResume: (CCMenuItemFont *)button{
    //does nothing
}

/** Handles pressing the options button*/
-(void) onOptions: (CCMenuItemFont *)button {
    [[CCDirector sharedDirector] pushScene:[OptionsScreen scene]];
}

/** Handles pressing the quit button*/
-(void) onQuit:(CCMenuItemFont *)button {
    [[CCDirector sharedDirector] pushScene:[QuitScreen scene]];
}



@end

