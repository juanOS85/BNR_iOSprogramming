//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Juan Obando on 12/28/15.
//  Copyright © 2015 Juan Obando. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  if (self) {
    // Set the tab bar item's title
    self.tabBarItem.title = @"Hypnotize";

    // Create an UIImage from a file
    // This will use Hypno@2x.png on retina display devices
    UIImage *i = [UIImage imageNamed:@"Hypno.png"];

    // Put the image on the tab bar item
    self.tabBarItem.image = i;
  }

  return self;
}

- (void)loadView
{
  // Create a view
  BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];

  // Set it as *the* view of this View Controller
  self.view = backgroundView;
}

@end
