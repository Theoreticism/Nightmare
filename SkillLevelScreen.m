//
//  SkillLevelScreen.m
//  Nightmare
//
//  Created by Chris Lee and Mike McElligott on 10/7/14.
//  Copyright 2014 Chris Lee and Mike McElligott. All rights reserved.
//

#import "SkillLevelScreen.h"
#import "Lives.h"

@implementation SkillLevelScreen

+(CCScene *) scene {
    // Get a scene
    CCScene* scene = [CCScene node];
    
    // Construct a skill level screen and add it to the scene
    SkillLevelScreen *layer = [SkillLevelScreen node];
    
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
        CCMenuItem *backButton = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenuItem *beginnerButton = [CCMenuItemFont itemWithString:@"Beginner" target:self selector:@selector(onBeginner:)];
        
        CCMenuItem *intermediateButton = [CCMenuItemFont itemWithString:@"Intermediate" target:self selector:@selector(onIntermediate:)];
        
        CCMenuItem *advancedButton = [CCMenuItemFont itemWithString:@"Advanced" target:self selector:@selector(onAdvanced:)];
        
        CCMenu *menu = [CCMenu menuWithItems: beginnerButton, intermediateButton, advancedButton, backButton, nil];
        
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

-(void) onBeginner:(CCMenuItemFont *)button {
    [Lives set: 5];
}

-(void) onIntermediate:(CCMenuItemFont *)button {
    [Lives set: 3];
}

-(void) onAdvanced:(CCMenuItemFont *)button {
    [Lives set: 1];
}

@end