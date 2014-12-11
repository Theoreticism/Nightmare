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
static CCLabelTTF *score1;
static CCLabelTTF *score2;
static CCLabelTTF *score3;

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
+ (void) Update: (int) num {
    if (num > arr[0]) {
        arr[2] = arr[1];
        arr[1] = arr[0];
        arr[0] = num;
    } else if (num > arr[1]) {
        arr[2] = arr[1];
        arr[1] = num;
    } else {
        arr[2] = num;
    }
    
    NSString* text = @"0";
    text = [text stringByAppendingString:[NSString stringWithFormat:@"%d",arr[0]]];
    score1 = [CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:12];
    text = [text stringByAppendingString:[NSString stringWithFormat:@"%d",arr[1]]];
    score2 = [CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:12];
    text = [text stringByAppendingString:[NSString stringWithFormat:@"%d",arr[2]]];
    score3 = [CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:12];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //save data
    [defaults setInteger:arr[0] forKey:@"HighScore1"];
    [defaults setInteger:arr[1] forKey:@"HighScore2"];
    [defaults setInteger:arr[2] forKey:@"HighScore3"];
    [defaults synchronize];
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
        
        //load data
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSInteger hs1 = [defaults integerForKey:@"HighScore1"];
        NSInteger hs2 = [defaults integerForKey:@"HighScore2"];
        NSInteger hs3 = [defaults integerForKey:@"HighScore3"];
        arr[0] = hs1;
        arr[1] = hs2;
        arr[2] = hs3;
        
        CCLabelTTF *score1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", arr[0]] fontName:@"Marker Felt" fontSize:12];
        CCLabelTTF *score2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", arr[1]] fontName:@"Marker Felt" fontSize:12];
        CCLabelTTF *score3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", arr[2]] fontName:@"Marker Felt" fontSize:12];
        score1.position =  ccp( screenWidth /2 , screenHeight /1.5f);
        score1.color = ccc3(255,255,255);
        score2.position =  ccp( screenWidth /2 , screenHeight /1.7f);
        score2.color = ccc3(255,255,255);
        score3.position =  ccp( screenWidth /2 , screenHeight /1.9f);
        score3.color = ccc3(255,255,255);
        
        [self addChild:label];
        [self addChild:score1];
        [self addChild:score2];
        [self addChild:score3];
        
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

