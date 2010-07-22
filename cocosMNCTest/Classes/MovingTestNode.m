//
//  MovingTestNode.m
//  cocosMNCTest
//
//  Created by jeremy on 7/21/10.
//  Copyright 2010 N/A. All rights reserved.
//

#import "MovingTestNode.h"
#import "TestModel.h"


@implementation MovingTestNode

-(void)modelDidChange:(TestModel *)model {
	[super modelDidChange:model];
	[self runAction:[CCEaseExponentialOut actionWithAction:[CCMoveBy actionWithDuration: 1.0
																		   position: ccp(CCRANDOM_MINUS1_1()*20, CCRANDOM_MINUS1_1()*20)]]];
}

@end
