//
//  CocosNode+Additions.m
//  OMGTTT
//
//  Created by Jeremy on 12/18/09.
//  Copyright 2009 Jeremy Flores. All rights reserved.
//

#import "CocosNode+Additions.h"


@implementation CocosNode (Additions)

@dynamic rect, center;

-(CGRect) rect
{
	return CGRectMake( self.position.x - contentSize_.width*anchorPoint_.x, self.position.y-
					  contentSize_.height*anchorPoint_.y,
					  contentSize_.width, contentSize_.height);
}

-(CGPoint) center {
	float x = self.rect.origin.x + self.rect.size.width/2;
	float y = self.rect.origin.y + self.rect.size.height/2;
	return ccp(x,y);
}

-(BOOL)isTouchInRect:(UITouch *)touch {
	CGPoint touchLocation = [touch locationInView: [touch view]];
	touchLocation = [[Director sharedDirector] convertToGL: touchLocation];
	CGPoint local = [self convertToNodeSpace:touchLocation];
	CGRect r = self.rect;
	r.origin = CGPointZero;
	if( CGRectContainsPoint( r, local ) ) {
		return YES;
	}
	else {
		return NO;
	}
}

@end
