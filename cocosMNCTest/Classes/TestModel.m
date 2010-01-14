//
//  TestModel.m
//  OMGTTT
//
//  Created by Jeremy on 1/12/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import "TestModel.h"


@implementation TestModel

@synthesize color, string;

-(id)init {
	if (self=[super init]) {
		color = ccBLUE;
		string = @"Default Value!";
	}
	return self;
}

-(void)setColor:(ccColor3B)aColor {
	color = aColor;
	[self didChange];
}

-(void)setString:(NSString *)aString {
	if (string) {
		[string release];
		string = nil;
	}

	string = [aString retain];

	[self didChange];
}

@end
