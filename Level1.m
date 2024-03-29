//
//  Level1.m
//  iMGABaseCC
//
//  Created by Ron Coleman on 12/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Level1.h"
#import "Helper.h"
#import "Shadow.h"
#import "Horror.h"
#import "SoundEffects.h"
#import "Lives.h"

#define TILED_MAP @"level1.tmx"
#define REWARD_CRUSH_MONSTA 20

@implementation Level1

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Level1 *layer = [Level1 node];
	
	// add layer as a child to scene
	[scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];

	return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level1 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:TILED_MAP];
    
    if((self = [super init])) {
        bubbles = [[NSArray alloc]initWithObjects:
                   @"No escape...",@"Join us...",@"Darkness looms!",@"Nothing can save you!",@"Death and decay!",nil];
        
        feedback = [CCLabelTTF labelWithString:@"" fontName:@"Xposed" fontSize:24];
        
        [feedback setVisible:FALSE];
        
        [feedback setColor:ccc3(0,0,0)];
        
        [feedback setAnchorPoint:ccp(0,0)];
        
        // If you forget to add the feedback to the world and try to position
        // it later, cocos2d crashes
        [self addChild:feedback z:95];
    }

	return self;
}

- (void) initWorld {
    [super initWorld];
    
    CGSize size = [world mapSize];
    
    stalksLayer = [world layerNamed:@"stalks"];
    
    enemiesLayer = [world layerNamed:@"enemies"];
    
    hasWeapon = false;
    
    [enemiesLayer setVisible:false];
    
    enemies = [[NSMutableArray alloc] init];
       
    for(int tilex = 0; tilex < size.width; tilex++) {
        for(int tiley = 0; tiley < size.height; tiley++) {
            int gid = [enemiesLayer tileGIDAt:ccp(tilex,tiley)];
            
//            CGPoint here = [Helper tileToWorldX:tilex andY:tiley];
            CGPoint here = [Helper tile:ccp(tilex,tiley) toWorld:world];
            
            if(gid == RID_SHADOW) {
                Shadow* shadow = (Shadow*) [[Shadow alloc] initAt:here of:self];
                
                [self addChild:shadow z:90];
                
                [enemies addObject:shadow];
            }
            
            else if(gid == RID_HORROR) {
                Horror* horror = (Horror*) [[Horror alloc] initAt:here of:self];
                
                [self addChild:horror z:90];
                
                [enemies addObject:horror];
            }
            
        }
    }
}

-(void) update:(ccTime)dt {     
    if(caught || complete)
        return;
       
    [super update:dt];
    
    if(complete) {
        [Helper goLevel];
    }
        
    for(Enemy* enemy in enemies) {
        [enemy update];
    }
    
    if(caught)
        [self handlePCCaught];
    
    [self scroll];
}

-(void) handlePCCaught {
	[Lives decrement];
    
    // Play random sound
    [SoundEffects boo];
    
	// Show random feedback message
	int sz = [bubbles count];
	
	int lottery = rand() % sz;
	
	NSString* message = [bubbles objectAtIndex:lottery];
    
    [feedback setString:message];

    // Position the feedback on the screen just above grace's head.
    // (Grace's world coordinate is its screen coordinate since grace
    // has been scrolled with the world!
    // Note: TOPOINT converts world -> point coordinate to compensate for Retina displays
    feedback.position = ccp(TOPOINT(player.x), TOPOINT(player.y + player.height));

    [feedback setVisible:TRUE];
	
	// Set the alarm to freeze everybody
	[NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(caughtReset) userInfo:nil repeats:NO];
}

- (void) caughtReset {
	// Unfreeze everybody only if there are more lives
	if([Lives remaining] == 0) {
		[Helper goOver];
		
		return;
	}
    
	// Reset grace to its initial position and not moving
    [player reset];
    
    [self setPosition:ccp(0, 0)];
    
    [feedback setVisible:FALSE];
    
	caught = FALSE;
}

- (bool) collidesWith: (id) enemy_ {
    // Note: enemy_ is id, not Enemy, type because Enemy talks to AbstractLevel and
    // invokes this method which in abstract doesn't know about Enemy.
    
    // Check for collision with a block or platform
    Enemy* enemy = (Enemy*) enemy_;
    
    int xoffs[] = { 0, enemy.width };
    
    for(int i=0; i < 2; i++) {
        CGPoint position = ccp(enemy.x,enemy.y);
        
        position.x += xoffs[i];
        
        CGPoint point = [Helper world:world toTile:position];
    
        int gid = [enemiesLayer tileGIDAt:point];
    
        if(gid == RID_ENEMY_BLOCK) {
            return TRUE;
        }
    
        // Check for a collision with platforms
        gid = [platforms tileGIDAt:point];
    
        if(gid != 0) {
            return TRUE;
        }
    }
    
    // Check for a collision with Player
    if([player collidesWithEntity:enemy]) {
		// If grace jumps on an enemy, give 'em some points and a cheer
		if(([enemy isKindOfClass:[Shadow class]] && [player landsOn:enemy]) ||
           ([enemy isKindOfClass:[Horror class]] && hasWeapon == TRUE) ||
           ([enemy isKindOfClass:[Shadow class]] && hasWeapon == TRUE)) {
			enemy.state = STATE_DYING;
			
			[Score increment:REWARD_CRUSH_MONSTA];
            
            [SoundEffects yeah];
			
			return FALSE;
		}
		
        // Otherwise, grace is caught       
		return caught = TRUE;        
    }
        
    return FALSE;
}

- (bool) onLadda:(CGPoint) position {
    CGPoint tile = [Helper world:world toTile:position];
    
    if(![Helper tile:tile validIn:world])
        return FALSE;
    
    int gid = [stalksLayer tileGIDAt:tile];
    
    if(gid == 0)
        return FALSE;
    
    return TRUE;    
}
@end
