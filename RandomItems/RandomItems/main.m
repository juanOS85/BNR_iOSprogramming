//
//  main.m
//  RandomItems
//
//  Created by Juan Obando on 9/27/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // Create a mutable array object, store its address in items variable
    NSMutableArray *items = [[NSMutableArray alloc] init];

//    for (int i = 0; i < 10; i += 1) {
//      BNRItem *item = [BNRItem randomItem];
//      [items addObject:item];
//    }

    BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
    [items addObject:backpack];

    BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
    [items addObject:calculator];

    backpack.containedItem = calculator;

    backpack = nil;
    calculator = nil;

    for (BNRItem *item in items) {
      NSLog(@"%@", item);
    }

    NSLog(@"Settings items to nil...");

    // Destroy the mutable array object.
    items = nil;
  }
    return 0;
}
