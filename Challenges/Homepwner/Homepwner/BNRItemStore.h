//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Juan Obando on 7/9/16.
//  Copyright © 2016 Juan Obando. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

// Notice this is a class method and prefixed with a + instead of a -
+ (instancetype)sharedStore;

- (BNRItem *)createItem;

@end
