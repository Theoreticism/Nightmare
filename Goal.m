//
//  Goal.m
//  iMGABaseCC
//
//  Created by Ron Coleman on 12/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Goal.h"

@implementation Goal
- (Goal*) initAt:(CGPoint) point {
    
    [super initWithFrames: @"goal.png" width:16 andHeight:16];
    
    if(self != nil) {
        self.position = point;
    }
    
    return self;
}
@end
