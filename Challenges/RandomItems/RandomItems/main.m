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
  }
    return 0;
}
