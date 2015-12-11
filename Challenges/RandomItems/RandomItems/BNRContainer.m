//
//  BNRContainer.m
//  RandomItems
//
//  Created by Juan Obando on 12/7/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value;
{
  self = [super initWithItemName:name
                  valueInDollars:value
                    serialNumber:@""];

  if (self) {
    _subitems = [[NSMutableArray alloc] init];
  }

  return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
  return [self initWithItemName:name
                 valueInDollars:0];
}

- (void)addSubitem:(BNRItem *)subitem
{
  [self.subitems addObject:subitem];

  self.valueInDollars += subitem.valueInDollars;
}

- (NSString *)description
{
  NSString *desriptionString = [[NSString alloc] initWithFormat:@"%@: Worth $%d, recorded on %@",
                                self.itemName,
                                self.valueInDollars,
                                self.dateCreated];

  for (BNRContainer *item in self.subitems) {
    desriptionString = [desriptionString stringByAppendingFormat:@"\n%@", item];
  }

  return desriptionString;
}

- (void)setSubitems:(NSMutableArray *)subitems
{
  _subitems = subitems;
}

- (NSMutableArray *)subitems
{
  return _subitems;
}

@end
