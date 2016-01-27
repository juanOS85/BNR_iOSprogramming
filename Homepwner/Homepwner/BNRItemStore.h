//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Juan Obando on 1/26/16.
//  Copyright © 2016 Juan Obando. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

+ (instancetype)sharedStore;

- (BNRItem *)createItem;

@end
