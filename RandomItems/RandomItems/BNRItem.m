//
//  BNRItem.m
//  RandomItems
//
//  Created by Juan Obando on 9/27/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
  // Call the superclass's designated initializer
  self = [super init];

  // Did the superclass's designated initializer succeed?
  if (self) {
    // Give the instance variables initial values
    _itemName = name;
    _serialNumber = sNumber;
    _valueinDollars = value;

    // Set _dateCreated to the current date and time
    _dateCreated = [[NSDate alloc] init];
  }

  // Return the address of the newly initialized object
  return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
  return [self initWithItemName:name
                 valueInDollars:0
                   serialNumber:@""];
}

- (instancetype)init
{
  return [self initWithItemName:@"Item"];
}

- (void) setItemName:(NSString *)str
{
    _itemName = str;
}
- (NSString *)itemName
{
    return _itemName;
}

- (void) setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}
- (NSString *)serialNumber
{
    return _serialNumber;
}

- (void)setValueInDollars:(int)v
{
    _valueinDollars = v;
}
- (int)valueInDollars
{
    return _valueinDollars;
}

- (NSDate *)dateCreated
{
    return _dateCreated;
}

- (NSString *)description
{
  NSString *desriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                self.itemName,
                                self.serialNumber,
                                self.valueInDollars,
                                self.dateCreated];

  return desriptionString;
}

@end