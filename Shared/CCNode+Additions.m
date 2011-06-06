//
//  CCNode+Additions.m
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

#import "CCNode+Additions.h"


@implementation CCNode (Additions)

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
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
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
