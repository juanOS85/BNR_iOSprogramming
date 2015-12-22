//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Juan Obando on 12/15/15.
//  Copyright © 2015 Juan Obando. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];

  if (self) {
    // All BNRHypnosisView start with a clear background color
    self.backgroundColor = [UIColor clearColor];
  }

  return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  CGContextRef currentContext = UIGraphicsGetCurrentContext();

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

  // Configure the drawing color to light gray
  [[UIColor lightGrayColor] setStroke];

  // Draw the line!
  [path stroke];

  // Gold challenge - Gradient part
  UIBezierPath *trianglePath = [[UIBezierPath alloc] init];

  [trianglePath moveToPoint:CGPointMake(center.x,
                                bounds.origin.y + bounds.size.height / 4.0)];
  [trianglePath addLineToPoint:CGPointMake(0.0, bounds.origin.y + bounds.size.height)];
  [trianglePath addLineToPoint:CGPointMake(bounds.size.width, bounds.origin.y + bounds.size.height)];
  [trianglePath closePath];

  CGContextSaveGState(currentContext);

  [trianglePath addClip];

  CGFloat locations[2] = { 0.0, 1.0 };
  CGFloat components[8] = { 0.0, 1.0, 0.0, 1.0, // start color
                            1.0, 1.0, 0.0, 1.0 }; // end color

  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace,
                                                               components,
                                                               locations,
                                                               2);

  CGPoint startPoint = CGPointMake(0.0,
                                   bounds.origin.y + bounds.size.height / 4.0);
  CGPoint endPoint = CGPointMake(0.0, startPoint.y + bounds.size.height / 2.0);

  CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
  CGGradientRelease(gradient);
  CGColorSpaceRelease(colorSpace);

  CGContextRestoreGState(currentContext);

  // Bronze challenge
  CGRect logoImageRect = CGRectMake(bounds.origin.x + bounds.size.width / 4.0,
                                    bounds.origin.y + bounds.size.height / 4.0,
                                    bounds.size.width / 2.0,
                                    bounds.size.height / 2.0);

  UIImage *logoImage = [UIImage imageNamed:@"logo.png"];

  // Gold challenge - Shadows part
  CGContextSaveGState(currentContext);
  CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);

  [logoImage drawInRect:logoImageRect];

  CGContextRestoreGState(currentContext);
}

@end
