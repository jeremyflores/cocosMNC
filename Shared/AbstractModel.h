//
//  AbstractModel.h
//  OMGTTT
//
//  Created by Jeremy on 1/11/10.
//  Copyright 2010 Jeremy Flores. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AbstractModel;

@protocol ModelDelegate <NSObject>

@required
-(void)modelDidChange:(AbstractModel *)model;

@end

// private methods for AbstractModel
@protocol AbstractModel <NSObject>

@required
-(void)didChange;	// notifies delegates of change. object is responsible for calling this internally

@end


@interface AbstractModel : NSObject<AbstractModel> {
	NSMutableSet *delegates;
}

-(void)addDelegate:(id<ModelDelegate>)delegate;
-(void)removeDelegate:(id<ModelDelegate>)delegate;

@end
