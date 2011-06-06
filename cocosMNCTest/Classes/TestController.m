//
//  TestController.m
//  OMGTTT
//
//
//	Copyright (c) 2010 Jeremy Flores

//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:

//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.

//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.

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
