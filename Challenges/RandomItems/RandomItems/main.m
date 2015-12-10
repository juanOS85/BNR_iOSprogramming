//
//  main.m
//  RandomItems
//
//  Created by Juan Obando on 9/27/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    BNRContainer *container = [[BNRContainer alloc] initWithItemName:@"Container 1"];

    for (int i = 0; i < 10; i += 1) {
      BNRItem *item = [BNRItem randomItem];
      [container addSubitem:item];
    }

    NSLog(@"%@", container);
//    // Create a mutable array object, store its address in items variable
//    NSMutableArray *items = [[NSMutableArray alloc] init];
//
//    for (int i = 0; i < 10; i += 1) {
//      BNRItem *item = [BNRItem randomItem];
//      [items addObject:item];
//    }
//
//    for (BNRItem *item in items) {
//      NSLog(@"%@", item);
//    }
//
//    // Destroy the mutable array object.
//    items = nil;
  }
    return 0;
}
