//
//  OptionsScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "OptionsScreen.h"
#import "AudioScreen.h"
#import "SkillLevelScreen.h"
#import "HighScoreScreen.h"

@implementation OptionsScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct an options screen and add it to the scene
    OptionsScreen *layer = [OptionsScreen node];
    
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
        CCMenuItem *audioButton = [CCMenuItemFont itemWithString:@"Audio" target:self selector:@selector(onAudio:)];
        
        CCMenuItem *skillLevelButton = [CCMenuItemFont itemWithString:@"Skill Level" target:self selector:@selector(onSkillLevel:)];
        
        CCMenuItem *highScoresButton = [CCMenuItemFont itemWithString:@"High Scores" target:self selector:@selector(onHighScores:)];
        
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu *menu = [CCMenu menuWithItems:audioButton, skillLevelButton, highScoresButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight* 0.25f)];
        
        //add the menu to the Layer
        [self addChild:menu];
    }
    
    return self;
}

-(void) onAudio: (CCMenuItemFont *)button {
    [[CCDirector sharedDirector] pushScene:[AudioScreen scene]];
}

-(void) onSkillLevel: (CCMenuItemFont *)button {
    [[CCDirector sharedDirector] pushScene:[SkillLevelScreen scene]];
}

-(void) onHighScores: (CCMenuItemFont *)button {
    [[CCDirector sharedDirector] pushScene:[HighScoreScreen scene]];
}

-(void) onBack: (CCMenuItemFont *)button {
    [[CCDirector sharedDirector] popScene];
}

@end