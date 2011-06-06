//
//  TestNode.m
//  cocosMNCTest
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

#import "TestNode.h"
#import "TestModel.h"

@implementation TestNode

-(id) init {
	if (self=[super initWithString:@"" fontName:@"Marker Felt" fontSize:32]) {
		self.anchorPoint = ccp(0.5, 0.5);
		self.position = ccp(320/2, 480/2);
	}
	return self;
}

-(void)modelDidChange:(TestModel *)model {
	[self setString:model.title];
	[self setColor:model.color];
	NSLog(@"%@ %d %d %d", model.title, model.color.r, model.color.g, model.color.b);
}

@end
