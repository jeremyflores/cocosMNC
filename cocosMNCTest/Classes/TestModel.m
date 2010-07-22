//
//  TestModel.m
//  cocosMNCTest
//
//  Created by jeremy on 7/21/10.
//  Copyright 2010 N/A. All rights reserved.
//

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
