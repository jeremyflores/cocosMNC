//
//  TestNode.m
//  cocosMNCTest
//
//  Created by jeremy on 7/21/10.
//  Copyright 2010 N/A. All rights reserved.
//

#import "TestNode.h"
#import "TestModel.h"

@implementation TestNode

-(id) init {
	if (self=[super initWithString:@"" fontName:@"Marker Felt" fontSize:32]) {
		self.anchorPoint = ccp(0.5, 0.5);
		self.position = ccp(320/2, 480/2);
	}
	return self;
}

-(void)modelDidChange:(TestModel *)model {
	[self setString:model.title];
	[self setColor:model.color];
	NSLog(@"%@ %d %d %d", model.title, model.color.r, model.color.g, model.color.b);
}

@end
