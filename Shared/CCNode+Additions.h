//
//  CocosNode+Additions.h
//  OMGTTT
//
//  Created by Jeremy on 12/18/09.
//  Copyright 2009 Jeremy Flores. All rights reserved.
//


#import "cocos2d.h"

@interface CCNode (Additions)

@property (nonatomic, readonly) CGRect rect;	// dynamic
@property (nonatomic, readonly) CGPoint center;	// dynamic

-(BOOL)isTouchInRect:(UITouch *)touch;

@end
