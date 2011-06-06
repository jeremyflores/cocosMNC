//
//  TestModel.m
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

#import "TestModel.h"


@implementation TestModel

@synthesize title, color;

-(id) init {
	return [self initWithTitle:@"Default title" color:ccc3(255, 255, 255)];
}

-(id) initWithTitle:(NSString *)aTitle color:(ccColor3B)aColor {
	if (self=[super init]) {
		title = [aTitle retain];
		self.color = aColor;
	}
	return self;
}

-(void) setTitle:(NSString *)aTitle {
	NSLog(@"set title to %@", aTitle);
	[title release];
	title = [aTitle retain];
	[self didChange];
}

-(void) setColor:(ccColor3B)aColor {
	color = aColor;
	[self didChange];
}

-(void) dealloc {
	[title release];
	
	[super dealloc];
}

@end
