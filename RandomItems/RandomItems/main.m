//
//  main.m
//  RandomItems
//
//  Created by Juan Obando on 9/27/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // Create a mutable array object, store its address in items variable
    NSMutableArray *items = [[NSMutableArray alloc] init];

    // Send the message addObject: to the NSMutableArray pointed to
    // by the variable items, passing the string each time
    [items addObject:@"One"];
    [items addObject:@"Two"];
    [items addObject:@"Three"];

    // Send another message, insertObject:atIndex:, to that same array object
    [items insertObject:@"Zero" atIndex:0];

    for (int i = 0; i < [items count]; i += 1) {
      NSString *item = [items objectAtIndex:i];
      NSLog(@"%@", item);
    }

    // Destroy the mutable array object.
    items = nil;
  }
    return 0;
}
