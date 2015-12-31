//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Juan Obando on 12/28/15.
//  Copyright © 2015 Juan Obando. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>
@end

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
  CGRect frame = [UIScreen mainScreen].bounds;

  // Create a view
  BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];

  CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
  UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];

  // Setting the border style for the text field will allow to see it more easily
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.placeholder = @"Hypnotize me";
  textField.returnKeyType = UIReturnKeyDone;

  textField.delegate = self;

  [backgroundView addSubview:textField];

  // Set it as *the* view of this View Controller
  self.view = backgroundView;
}

- (void)viewDidLoad
{
  // Always call the super implementation of viewDidLoad
  [super viewDidLoad];

  NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [self drawHypnoticMessage:textField.text];

  textField.text = @"";
  [textField resignFirstResponder];

  return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
  for (int i = 0; i < 20; i += 1) {
    UILabel *messageLabel = [[UILabel alloc] init];

    //Configure the label's color and text
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.text = message;

    // This method resizes the label, which will be relative to the text that
    // it is displaying.
    [messageLabel sizeToFit];

    // Get a random x value that fits within the hypnosis view's width
    int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
    int x = arc4random() % width;

    // Get a random y value that fits within the hypnosis view's height
    int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
    int y = arc4random() % height;

    CGRect frame = messageLabel.frame;
    frame.origin = CGPointMake(x, y);
    messageLabel.frame = frame;

    [self.view addSubview:messageLabel];
  }
}

@end
