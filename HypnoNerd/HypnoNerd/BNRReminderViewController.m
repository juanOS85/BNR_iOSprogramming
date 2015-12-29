//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Juan Obando on 12/28/15.
//  Copyright © 2015 Juan Obando. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  if (self) {
    // Get the tab bar item
    UITabBarItem *tbi = self.tabBarItem;

    // Give it a label
    tbi.title = @"Reminder";

    // Give it an image
    UIImage *i = [UIImage imageNamed:@"Time.png"];
    tbi.image = i;
  }

  return self;
}

- (void)viewDidLoad
{
  // Always call the super implementation of viewDidLoad
  [super viewDidLoad];

  NSLog(@"BNRReminderViewController loaded its view.");
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];

  self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender
{
  NSDate *date = self.datePicker.date;
  NSLog(@"Setting a reminder for %@", date);

  UILocalNotification *note = [[UILocalNotification alloc] init];
  note.alertBody = @"Hypnotize me!";
  note.fireDate = date;

  [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end
