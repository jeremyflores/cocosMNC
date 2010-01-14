//
//  TestController.m
//  OMGTTT
//
//  Created by Jeremy on 1/12/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import "TestController.h"

#import "TestModel.h"
#import "TestNode.h"
#import "MovingTestNode.h"

@implementation TestController

-(id)init {
	if (self=[super init]) {
		self.cocosNode = [TestNode new];
		self.model = [TestModel new];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	static int x = 1;

	// only do anything if the touch is in the node's rectangle
	if ([self.cocosNode isTouchInRect:touch]) {
		// every 4 touches, alternate between a moving view and a non-moving view
		if (x%4 == 0) {
			TestNode *newNode;

			if (x%8 == 0) {
				newNode = [TestNode new];
			}
			else {
				newNode = [MovingTestNode new];
			}
			newNode.position = self.cocosNode.position;
			self.cocosNode = newNode;
		}

		// every 3 touches, alternate between a green model or a red model with a different default string
		if (x%3 == 0) {
			TestModel *newModel = [TestModel new];
			if (x%6 == 0) {
				newModel.color = ccGREEN;
			}
			else {
				newModel.color = ccRED;
				newModel.string = @"OMG New Model!";
			}
			self.model = newModel;
		}
		else {	// if x%3 == 1 or == 2, then just display x.
			TestModel *testModel = (TestModel *)self.model;
			testModel.string = [NSString stringWithFormat:@"%d", x];
		}
		x++;
	}
	return kEventHandled;
}

@end
