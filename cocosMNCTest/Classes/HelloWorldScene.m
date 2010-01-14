//
// cocos2d Hello World example
// http://www.cocos2d-iphone.org
//

// Import the interfaces
#import "HelloWorldScene.h"

#import "TestController.h"

@implementation HelloWorld

+(id) scene
{
	Scene *scene = [Scene node];
	HelloWorld *layer = [HelloWorld node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init] )) {
		TestController *controller = [TestController new];
		
		[self addChild:controller.cocosNode];
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}
@end
