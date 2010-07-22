//
//  FirstScene.m
//  cocosMNCTest
//
//  Created by jeremy on 7/21/10.
//  Copyright 2010 N/A. All rights reserved.
//

#import "FirstScene.h"
#import "TestNodeController.h"

@implementation FirstScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	FirstScene *layer = [FirstScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if (self=[super init]) {
		TestNodeController *testController = [[TestNodeController new] autorelease];
		[self addChild:testController.node];
	}
	return self;
}	

@end
