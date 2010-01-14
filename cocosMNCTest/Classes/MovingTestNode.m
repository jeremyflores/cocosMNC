//
//  MovingTestNode.m
//  OMGTTT
//
//  Created by Jeremy on 1/14/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import "MovingTestNode.h"


@implementation MovingTestNode

-(void)modelDidChange:(TestModel *)model {
	[super modelDidChange:model];
	[self runAction:[EaseExponentialOut actionWithAction:[MoveBy actionWithDuration: 1.0
									  position: ccp(CCRANDOM_MINUS1_1()*20, CCRANDOM_MINUS1_1()*20)]]];
}

@end
