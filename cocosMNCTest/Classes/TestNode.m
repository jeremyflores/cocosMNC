//
//  TestNode.m
//  OMGTTT
//
//  Created by Jeremy on 1/12/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import "TestNode.h"
#import "CocosNode+Additions.h"

@implementation TestNode

-(id)init {
	if (self=[super initWithString:@"" fontName:@"Marker Felt" fontSize:32]) {
		self.anchorPoint = ccp(0.5, 0.5);
		self.position = ccp(320/2, 480/2);
	}
	return self;
}

-(void)modelDidChange:(TestModel *)model {
	[self setString:model.string];
	[self setColor:model.color];
}

@end
