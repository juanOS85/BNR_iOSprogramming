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

- (void)loadView
{
  // Create a view
  BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];

  // Set it as *the* view of this View Controller
  self.view = backgroundView;
}

@end
