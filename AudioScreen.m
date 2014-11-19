//
//  AudioScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "AudioScreen.h"
#import "Options.h"
#import "SimpleAudioEngine.h"
#import "SoundEffects.h"

#define THEME_SONG @"4225775_The_River_War_Original_Mix.mp3"

@implementation AudioScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct an options screen and add it to the scene
    AudioScreen *layer = [AudioScreen node];
    
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
        CCMenuItem *soundsOnButton = [CCMenuItemFont itemWithString:@"Sounds On" target:self selector:@selector(onSoundsOn:)];
        
        CCMenuItem *soundsOffButton = [CCMenuItemFont itemWithString:@"Sounds Off" target:self selector:@selector(onSoundsOff:)];
        
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems: soundsOnButton, soundsOffButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight* 0.25f)];
        
        //add the menu to the Layer
        [self addChild:menu];
    }
    
    return self;
}

-(void) onBack: (CCMenuItemFont *)button {
    [[CCDirector sharedDirector] popScene];
}

-(void) onSoundsOn:(CCMenuItemFont *)button {
    //Toggle music on
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic: THEME_SONG loop:true];
    [Options enableMusic:true];
    //Toggle sounds on
    [Options enableSounds:true];
}

-(void) onSoundsOff:(CCMenuItemFont *)button {
    //Toggle music off
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    [Options enableMusic:false];
    //Toggle sounds off
    [Options enableMusic: false];
}

@end