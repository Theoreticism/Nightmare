//
//  Level2.m
//  Nightmare
//
//  Created by Marist User on 12/8/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Level2.h"
#import "Helper.h"
#import "Lives.h"
#import "SoundEffects.h"

#define TILED_MAP @"level2.tmx"

@implementation Level2

+ (CCScene *) scene {
    
    CCScene* scene = [CCScene node];
    
    Level2 *layer = [Level2 node];
    
    [scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
    return scene;
    
}

- (id) init {
    if ([self isMemberOfClass:[Level2 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:TILED_MAP];
    
    return self;
}

- (void) initWorld {
    [super initWorld];
    
    obstaclesLayer = [world layerNamed:@"obstacles"];
    
    insanityLayer = [world layerNamed:@"insanity"];
}

- (void) update:(ccTime)dt {
    
}

- (void) handlePCObstacleCollision {
    
    int x = player.x;
    int y = player.y;
    
    CGPoint contact = [Helper world:world toTile:ccp(x, y)];
    
    int gid = [obstaclesLayer tileGIDAt:contact];
    
    if (gid == 0) {
        x += world.tileSize.width;
        
        contact = [Helper world:world toTile:ccp(x, y)];
        
        gid = [obstaclesLayer tileGIDAt:contact];
    }
    
    if (gid == RID_OBSTACLE) {
        [Lives decrement];
        
        [SoundEffects boo];
        
        [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(caughtReset) userInfo:nil repeats:NO];
    }
}

@end
