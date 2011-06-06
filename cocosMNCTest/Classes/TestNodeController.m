//
//  TestNodeController.m
//  cocosMNCTest
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

#import "TestNodeController.h"

#import "MovingTestNode.h"
#import "TestNode.h"
#import "TestModel.h"

#import "FirstScene.h"
#import "SecondScene.h"

@implementation TestNodeController

-(id) init {
	if (self=[super init]) {
		self.model = [[TestModel new] autorelease];
		self.node = [[TestNode new] autorelease];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	static int x = 1;
	static BOOL isFirstSceneRunning = YES;

	// only do anything if the touch is in the node's rectangle
	if ([self.node isTouchInRect:touch]) {
		// every 10 touches, alternate Scenes to demonstrate auto-registering/unregistering of touch events.
		if (x%10 == 0) {
			if (isFirstSceneRunning) {
				[[CCDirector sharedDirector] replaceScene:[SecondScene scene]];
			}
			else {
				[[CCDirector sharedDirector] replaceScene:[FirstScene scene]];
			}
			isFirstSceneRunning = !isFirstSceneRunning;
		}

		// every 4 touches, alternate between a moving view and a non-moving view
		if (x%4 == 0) {
			TestNode *newNode;
			
			if (x%8 == 0) {
				newNode = [[TestNode new] autorelease];
			}
			else {
				newNode = [[MovingTestNode new] autorelease];
			}
			newNode.position = self.node.position;
			self.node = newNode;
		}
		
		// every 3 touches, alternate between a green model or a red model with a different default string
		if (x%3 == 0) {
			TestModel *newModel = [[TestModel new] autorelease];
			if (x%6 == 0) {
				newModel.color = ccGREEN;
			}
			else {
				newModel.color = ccRED;
				newModel.title = @"OMG New Model!";
			}
			self.model = newModel;
		}
		else {	// if x%3 == 1 or == 2, then just display x.
			TestModel *testModel = (TestModel *)self.model;
			testModel.title = [NSString stringWithFormat:@"%d", x];
		}
		x++;
	}
	return YES;
}

@end
