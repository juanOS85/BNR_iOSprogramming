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
}

- (NSString *)description
{
  NSMutableString *itemsDescription = [[NSMutableString alloc] init];
  int containerValueInDollars = self.valueInDollars;
  
  for (BNRContainer *item in self.subitems) {
    containerValueInDollars += item.valueInDollars;
    [itemsDescription appendString:[item description]];
  }

  NSString *desriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@\n%@",
                                self.itemName,
                                self.serialNumber,
                                containerValueInDollars,
                                self.dateCreated,
                                itemsDescription];

  return desriptionString;

}

- (void)setSubitems:(NSMutableArray *)subitems
{
  self.subitems = subitems;
}

- (NSMutableArray *)subitems
{
  return self.subitems;
}

@end
