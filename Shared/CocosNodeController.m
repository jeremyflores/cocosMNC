//
//  CocosNodeController.m
//  OMGTTT
//
//  Created by Jeremy on 1/11/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import "CocosNodeController.h"


@implementation CocosNodeController

@synthesize model, cocosNode, swallowsTouches;

+(id)controllerWithCocosNode:(CocosNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel {
	return [[self alloc] initWithCocosNode:aNode model:aModel];
}

+(id)controllerWithCocosNode:(CocosNode *)aNode {
	return [[self alloc] initWithCocosNode:aNode];
}

+(id)controllerWithModel:(AbstractModel *)aModel {
	return [[self alloc] initWithModel:aModel];
}

-(id)initWithCocosNode:(CocosNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel {
	if (self=[self init]) {
		self.cocosNode = aNode;
		self.model = aModel;
	}
	return self;
}

-(id)initWithCocosNode:(CocosNode *)aNode {
	if (self=[self init]) {
		self.cocosNode = aNode;
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
		if (cocosNode) {
			[model removeDelegate:cocosNode];
		}
		[model release];
		model = nil;
	}
	model = [theModel retain];

	if (cocosNode) {
		[model addDelegate:cocosNode];
	}
}

-(void)setCocosNode:(CocosNode<ModelDelegate> *)aNode {
	CocosNode *parent = nil;
	int zOrder = 0;	// default value

	if (cocosNode) {
		zOrder = cocosNode.zOrder;
		parent = cocosNode.parent;

		if (model) {
			[model removeDelegate:cocosNode];
		}
		if (parent) {
			[parent removeChild:cocosNode cleanup:YES];
		}

		[cocosNode release];
		cocosNode = nil;
	}

	cocosNode = [aNode retain];

	if (model) {
		[model addDelegate:cocosNode];
	}
	if (parent) {
		[parent addChild:cocosNode z:zOrder];
	}
}

-(void)setSwallowsTouches:(BOOL)doesSwallowTouches {
	swallowsTouches = doesSwallowTouches;

	[[TouchDispatcher sharedDispatcher] removeDelegate:self];

	[[TouchDispatcher sharedDispatcher] addTargetedDelegate: self
												   priority: 0
											swallowsTouches: self.swallowsTouches];
}

// SUBCLASS
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	return kEventIgnored;
}

// SUBCLASS
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
}

// SUBCLASS
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
}

// SUBCLASS
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
}

-(void)dealloc {
	[model release];

	[super dealloc];
}

@end
