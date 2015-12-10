//
//  BNRContainer.h
//  RandomItems
//
//  Created by Juan Obando on 12/7/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
  NSMutableArray *_subitems;
}

// Initializers
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value;

- (instancetype)initWithItemName:(NSString *)name;

- (void)addSubitem:(BNRItem *)subitem;

- (void)setSubitems:(NSMutableArray *)subitems;
- (NSMutableArray *)subitems;

@end
