//
//  SecondScene.m
//  cocosMNCTest
//
//  Created by jeremy on 7/21/10.
//  Copyright 2010 N/A. All rights reserved.
//

#import "SecondScene.h"
#import "TestNodeController.h"
#import "TestModel.h"

@implementation SecondScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SecondScene *layer = [SecondScene node];
	
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
		TestModel *testModel = (TestModel *)testController.model;
		testModel.title = @"Second Scene!";
		testModel.color = ccc3(63, 63, 255);
		testController.node.position = ccp(200, 200);
		[self addChild:testController.node];
	}
	return self;
}	


@end
