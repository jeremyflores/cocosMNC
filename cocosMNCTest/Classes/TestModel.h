//
//  TestModel.h
//  cocosMNCTest
//
//  Created by jeremy on 7/21/10.
//  Copyright 2010 N/A. All rights reserved.
//

#import "AbstractModel.h"
#import "cocos2d.h"

@interface TestModel : AbstractModel {
	NSString *title;
	ccColor3B color;
}

@property (nonatomic) ccColor3B color;
@property (nonatomic, retain) NSString *title;

-(id) initWithTitle:(NSString *)aTitle color:(ccColor3B)aColor;

@end
