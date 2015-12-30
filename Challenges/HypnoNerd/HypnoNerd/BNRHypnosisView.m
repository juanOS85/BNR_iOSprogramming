//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Juan Obando on 12/15/15.
//  Copyright © 2015 Juan Obando. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];

  if (self) {
    // All BNRHypnosisView start with a clear background color
    self.backgroundColor = [UIColor clearColor];
    self.circleColor = [UIColor lightGrayColor];
  }

  return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  // Drawing code
  CGRect bounds = self.bounds;

  // Figure out the center of the bounds rectangle
  CGPoint center;
  center.x = bounds.origin.x + bounds.size.width / 2.0;
  center.y = bounds.origin.y + bounds.size.height / 2.0;

  // The largest circle will cricumscribe the view
  float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;

  UIBezierPath *path = [[UIBezierPath alloc] init];

  for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
    [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];

    [path addArcWithCenter:center
                    radius:currentRadius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
  }

  // Configure line width to 10 points
  path.lineWidth = 10;

  [self.circleColor setStroke];

  // Draw the line!
  [path stroke];

  UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
                                          initWithItems:@[@"Red", @"Green", @"Blue"]];

  segmentedControl.frame = CGRectMake(60, 50, 200, 50);

//  [segmentedControl setSelectedSegmentIndex:0];
  [segmentedControl addTarget:self
                       action:@selector(segmentedControlValueDidChange:)
             forControlEvents:UIControlEventValueChanged];

  [self addSubview:segmentedControl];
}

- (void)setCircleColor:(UIColor *)circleColor
{
  _circleColor = circleColor;
  [self setNeedsDisplay];
}

// When finger touches the screen
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  NSLog(@"%@ was toched", self);

  float red = (arc4random() % 100) / 100.0;
  float green = (arc4random() % 100) / 100.0;
  float blue = (arc4random() % 100) / 100.0;

  UIColor *randomColor = [UIColor colorWithRed:red
                                         green:green
                                          blue:blue
                                         alpha:1.0];

  self.circleColor = randomColor;
}

- (void)segmentedControlValueDidChange:(UISegmentedControl *)segment
{
  switch (segment.selectedSegmentIndex) {
    case 0:
      self.circleColor = [UIColor redColor];
      break;

    case 1:
      self.circleColor = [UIColor greenColor];
      break;

    case 2:
      self.circleColor = [UIColor blueColor];
      break;
  }
}

@end
