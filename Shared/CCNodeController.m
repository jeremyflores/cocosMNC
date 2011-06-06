//
//  CocosNodeController.m
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



#import "CCNodeController.h"


@implementation CCNodeController

@synthesize model, node, swallowsTouches;

+(id)controllerWithNode:(CCNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel {
	return [[self alloc] initWithNode:aNode model:aModel];
}

+(id)controllerWithNode:(CCNode *)aNode {
	return [[self alloc] initWithNode:aNode];
}

+(id)controllerWithModel:(AbstractModel *)aModel {
	return [[self alloc] initWithModel:aModel];
}

-(id)initWithNode:(CCNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel {
	if (self=[self init]) {
		self.node = aNode;
		self.model = aModel;
	}
	return self;
}

-(id)initWithNode:(CCNode *)aNode {
	if (self=[self init]) {
		self.node = aNode;
	}
	return self;
}

-(id)initWithModel:(AbstractModel *)aModel {
	if (self=[self init]) {
		self.model = aModel;
	}
	return self;
}

-(id)init {
	if (self=[super init]) {
		self.swallowsTouches = YES;
	}
	return self;
}

-(void)setModel:(AbstractModel *)theModel {
	if (model) {
		if (node) {
			[model removeDelegate:node];
		}
		[model release];
		model = nil;
	}
	model = [theModel retain];
	
	if (node) {
		[model addDelegate:node];
	}
}

-(void)setNode:(CCNode<ModelDelegate> *)aNode {
	CCNode *parent = nil;
	int zOrder = 0;	// default value
	
	if (node) {
		zOrder = node.zOrder;
		parent = node.parent;
		
		if (model) {
			[model removeDelegate:node];
		}
		if (parent) {
			[parent removeChild:node cleanup:YES];
		}

		node.controller = nil;
		[node release];
		node = nil;
	}
	
	node = [aNode retain];
	node.controller = self;
	
	if (model) {
		[model addDelegate:node];
	}
	if (parent) {
		[parent addChild:node z:zOrder];
	}
}

-(void)setSwallowsTouches:(BOOL)doesSwallowTouches {
	swallowsTouches = doesSwallowTouches;
	
	// If we have a Node and the Node is on screen
	if (node && node.isRunning) {
		[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate: self
														 priority: 0
												  swallowsTouches: self.swallowsTouches];
	}
}

- (void)onEnter {
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate: self
													 priority: 0 
											  swallowsTouches: self.swallowsTouches];
}

- (void)onExit {	
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
}

// OVERRIDE
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	return NO;
}

// OVERRIDE
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
}

// OVERRIDE
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
}

// OVERRIDE
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
}

-(void)dealloc {
	[model release];
	[node release];
	
	[super dealloc];
}

@end
