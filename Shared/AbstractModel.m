//
//  AbstractModel.m
//  OMGTTT
//
//  Created by Jeremy on 1/11/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import "AbstractModel.h"


@implementation AbstractModel

-(id)init {
	if (self=[super init]) {
		delegates = [NSMutableSet new];
	}
	return self;
}

-(void)didChange {
	for (id<ModelDelegate>delegate in delegates) {
		[delegate modelDidChange:self];
	}
}

-(void)addDelegate:(id<ModelDelegate>)delegate {
	[delegates addObject:delegate];
	[delegate modelDidChange:self];	// update the delegate with the newest model information
}

-(void)removeDelegate:(id<ModelDelegate>)delegate {
	[delegates removeObject:delegate];
}

-(void)dealloc {
	[delegates release];

	[super dealloc];
}

@end
