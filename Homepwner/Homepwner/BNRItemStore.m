//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Juan Obando on 1/26/16.
//  Copyright © 2016 Juan Obando. All rights reserved.
//

#import "BNRItemStore.h"

@implementation BNRItemStore

+ (instancetype)sharedStore
{
  static BNRItemStore *sharedStore = nil;

  // Do I need to create a sharedStore?
  if (!sharedStore) {
    sharedStore = [[self alloc] initPrivate];
  }

  return sharedStore;
}

// If programmer calls [[BNRItemStore alloc] init], let him know the error of
// his way
- (instancetype)init
{
  @throw [NSException exceptionWithName:@"Singleton"
                                 reason:@"Use +[BNRItemStore sharedStore]"
                               userInfo:nil];

  return nil;
}

// Real (secret) initializaer
- (instancetype)initPrivate
{
  self = [self init];

  return self;
}

@end
