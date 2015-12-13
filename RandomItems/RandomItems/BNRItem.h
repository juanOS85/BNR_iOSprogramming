//
//  BNRItem.h
//  RandomItems
//
//  Created by Juan Obando on 9/27/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
  NSString *_itemName;
  NSString *_serialNumber;
  int _valueinDollars;
  NSDate *_dateCreated;
  BNRItem *_containedItem;
  __weak BNRItem *_container;
}

+ (instancetype)randomItem;

// Designated initializer for BNRItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

- (void) setItemName:(NSString *)str;
- (NSString *)itemName;

- (void) setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (NSDate *)dateCreated;

- (void)setContainedItem:(BNRItem *)item;
- (BNRItem *)containedItem;

- (void)setContainer:(BNRItem *)item;
- (BNRItem *)container;

@end
