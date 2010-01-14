//
//  CocosNodeController.h
//  OMGTTT
//
//  Created by Jeremy on 1/11/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"
#import "CocosNode+Additions.h"

#import "AbstractModel.h"

@protocol ViewDelegate <NSObject>

@required
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;

@optional
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;

@end

@interface CocosNodeController : NSObject<ViewDelegate,TargetedTouchDelegate> {
	AbstractModel *model;
	CocosNode<ModelDelegate> *cocosNode;
	BOOL swallowsTouches;
}

@property (nonatomic, retain) AbstractModel *model;
@property (nonatomic, retain) CocosNode<ModelDelegate> *cocosNode;	// the "view" in MVC pattern
@property (nonatomic) BOOL swallowsTouches;

// Convenience methods in case you already have a model and / or view and just need the controller
+(id)controllerWithCocosNode:(CocosNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel;
+(id)controllerWithCocosNode:(CocosNode<ModelDelegate> *)aNode;
+(id)controllerWithModel:(AbstractModel *)aModel;

-(id)initWithCocosNode:(CocosNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel;
-(id)initWithCocosNode:(CocosNode<ModelDelegate> *)aNode;
-(id)initWithModel:(AbstractModel *)aModel;


// Touch methods are added here for clarity--originally comes from ViewDelegate protocol.
// These are abstract methods and need to be overriden in a subclass.

// By default, returns kEventIgnored
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;

@end