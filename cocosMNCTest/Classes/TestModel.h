//
//  TestModel.h
//  OMGTTT
//
//  Created by Jeremy on 1/12/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import "AbstractModel.h"
#import "cocos2d.h"

@interface TestModel : AbstractModel {
	ccColor3B color;
	NSString *string;
}

@property (nonatomic) ccColor3B color;
@property (nonatomic, retain) NSString *string;

@end
