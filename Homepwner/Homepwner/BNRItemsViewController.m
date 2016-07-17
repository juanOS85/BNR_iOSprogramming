//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Juan Obando on 6/30/16.
//  Copyright © 2016 Juan Obando. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

- (instancetype)init
{
  // Call the superclass's designated initializer.
  self = [super initWithStyle:UITableViewStylePlain];

  if (self) {
    for (int i = 0; i < 5; i++) {
      [[BNRItemStore sharedStore] createItem];
    }
  }

  return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
  return [self init];
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Create an instance of UITableViewCell, with default appearance
//  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                                 reuseIdentifier:@"UITableViewCell1"];

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                          forIndexPath:indexPath];

  // Set the text on the cell with the description of the item that is at the
  // n-th index of items, where n = row where this cell will appear in the
  // tableview
  NSArray *items = [[BNRItemStore sharedStore] allItems];
  BNRItem *item = items[indexPath.row];

  cell.textLabel.text = [item description];

  return cell;
}

@end
