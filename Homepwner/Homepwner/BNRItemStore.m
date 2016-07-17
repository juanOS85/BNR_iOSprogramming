//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Juan Obando on 7/9/16.
//  Copyright © 2016 Juan Obando. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic, copy) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
  static BNRItemStore *sharedStore = nil;

  // Do I need to create a shared store?
  if (!sharedStore) {
    sharedStore = [[self alloc] initPrivate];
  }

  return sharedStore;
}

// If a programer calls [[BNRItemStore alloc] init], let him know the error of
// his way.
- (instancetype)init
{
  @throw [NSException exceptionWithName:@"Singleton"
                                 reason:@"Use +[BNRItemStore sharedItem"
                               userInfo:nil];

  return nil;
}

// This is the real (secret) initializer.
- (instancetype)initPrivate
{
  self = [super init];

  if (self) {
    _privateItems = [[NSMutableArray alloc] init];
  }

  return self;
}

- (NSArray *)allItems
{
  return self.privateItems;
}

- (BNRItem *)createItem
{
  BNRItem *item = [BNRItem randomItem];

  [self.privateItems addObject:item];

  return item;
}

@end
