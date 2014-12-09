//
//  Level3.m
//  Nightmare
//
//  Created by Marist User on 12/8/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Level3.h"
#import "Helper.h"
#import "SoundEffects.h"

#define TILED_MAP @"level3.tmx"

@implementation Level3

+ (CCScene *) scene {
    
    CCScene* scene = [CCScene node];
    
    Level3 *layer = [Level3 node];
    
    [scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
    return scene;
    
}

- (id) init {
    if ([self isMemberOfClass:[Level3 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:TILED_MAP];

    return self;
}

- (void) initWorld {
    [super initWorld];
    
    weaponsLayer = [world layerNamed:@"weapons"];
}

- (void) update:(ccTime)dt {
    if (caught || complete)
        return;
    
    [super update:dt];
    
    if (complete)
        [Helper goLevel];
    
    for (Enemy* enemy in enemies)
        [enemy update];
    
    if (caught)
        [self handlePCCaught];
    
    if ([player collidesWith: weaponsLayer])
        [self handlePCWeaponCollision];
}

- (void) handlePCWeaponCollision {
    
    int x = player.x;
    int y = player.y;
    
    CGPoint contact = [Helper world:world toTile:ccp(x,y)];
    
    int gid = [weaponsLayer tileGIDAt: contact];
    
    if (gid == 0) {
        x += world.tileSize.width;
        
        contact = [Helper world:world toTile:ccp(x,y)];
        
        gid = [weaponsLayer tileGIDAt: contact];
    }
    
    if (gid == RID_WEAPON) {
        [SoundEffects big];
        
        hasWeapon = TRUE;
    }
    
    [weaponsLayer removeTileAt: contact];
}

@end
