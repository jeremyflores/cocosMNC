//
//  CocosNodeController.h
//  OMGTTT
//
//  Created by Jeremy on 1/11/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"
#import "CCNode+Additions.h"

#import "AbstractModel.h"

@protocol ViewDelegate <NSObject>

@required
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)onEnter;
- (void)onExit;

@optional
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;

@end

@interface CCNodeController : NSObject<ViewDelegate,CCTargetedTouchDelegate> {
	AbstractModel *model;
	CCNode<ModelDelegate> *node;
	BOOL swallowsTouches;
}

@property (nonatomic, retain) AbstractModel *model;
@property (nonatomic, retain) CCNode<ModelDelegate> *node;	// the "view" in MVC pattern
@property (nonatomic) BOOL swallowsTouches;

// Convenience methods in case you already have a model and / or view and just need the controller
+(id)controllerWithNode:(CCNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel;
+(id)controllerWithNode:(CCNode<ModelDelegate> *)aNode;
+(id)controllerWithModel:(AbstractModel *)aModel;

-(id)initWithNode:(CCNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel;
-(id)initWithNode:(CCNode<ModelDelegate> *)aNode;
-(id)initWithModel:(AbstractModel *)aModel;


// Touch methods are added here for clarity--originally comes from ViewDelegate protocol.
// These are abstract methods and need to be overriden in a subclass.

// By default, returns NO.
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;

@end