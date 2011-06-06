//
//  CocosNodeController.h
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