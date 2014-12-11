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
#import "Score.h"

#define TILED_MAP @"level2.tmx"

#define INSANITY_FRAGMENT 10

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
    
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void) initWorld {
    [super initWorld];
    
    obstaclesLayer = [world layerNamed:@"obstacles"];
    
    insanityLayer = [world layerNamed:@"insanity"];
}

- (void) update:(ccTime)dt {
    if (caught || complete)
        return;
    
    [super update:dt];
    
    if (complete)
        [Helper goLevel];
    
    if ([player collidesWith:insanityLayer]) {
        [self handlePCInsanityCollision];
    }
    
    if ([player collidesWith:obstaclesLayer]) {
        [self handlePCObstacleCollision];
    }
    
    if (caught && hitObstacle)
        [super handlePCCaught];
    
    [self scroll];
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
        
        hitObstacle = TRUE;
        caught = TRUE;
        
    }
}

- (void) handlePCInsanityCollision {
    
    int x = player.x;
    int y = player.y;
    
    CGPoint contact = [Helper world:world toTile:ccp(x, y)];
    
    int gid = [insanityLayer tileGIDAt:contact];
    
    if (gid == 0) {
        x += world.tileSize.width;
        
        contact = [Helper world:world toTile:ccp(x, y)];
        
        gid = [insanityLayer tileGIDAt:contact];
    }
    
    if (gid == RID_INSANITY_FRAGMENT) {
        
        [Score decrement:INSANITY_FRAGMENT];
        
        [SoundEffects boo];
        
    }
    
    [insanityLayer removeTileAt:contact];
    
}

@end
