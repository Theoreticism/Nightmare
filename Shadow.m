//
//  Gorgon.m
//  iMGABaseCC
//
//  Created by Ron Coleman on 12/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Shadow.h"

#define SPEED_MONSTA 2

#define FACING_RIGHT 0
#define FACING_LEFT 1
#define FACING_KILLED 2

@implementation Shadow
- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_ {
    [super initWithFrames: @"shadow.png" width:16 andHeight:16];
    
    self.frameNumber = FACING_LEFT;
    
	state = STATE_ALIVE;
	
	firstTime = TRUE;
	
	xSpeed = SPEED_MONSTA * [self toss];
	
	ySpeed = 0;
    
    [self collisionEvent];
	
	[self setPosition:here];
    
    level = level_;
	
	return self;
}

- (void) collisionEvent {
	if(state != STATE_ALIVE)
		return;
    
	xSpeed *= -1;
	
	if(xSpeed > 0)
		self.frameNumber = FACING_RIGHT;
	else 
		self.frameNumber = FACING_LEFT;
}

- (void) update {
	if(state == STATE_DEAD)
		return;
	
	if(state == STATE_ALIVE)
		[super update];
	
	else if(state == STATE_DYING && firstTime) {
		self.frameNumber = FACING_KILLED;
		
		firstTime = false;
        
		[self schedule:@selector(kill) interval:5.0f];
	}
}

- (void) kill {
    [self unschedule:@selector(kill)];
    
	state = STATE_DEAD;
	
	[level removeChild:self cleanup:true];
}
@end
