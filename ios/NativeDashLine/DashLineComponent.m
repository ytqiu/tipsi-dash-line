//
//  DashLineComponent.m
//  DashLineComponent
//

#import "DashLineComponent.h"

@implementation DashLineComponent
{
    UIColor *dashColor;
    CGFloat dashLineWidth;
    CGFloat dashLineSpace;
    BOOL horizontal;
}

- (id)init {
    self = [super init];
    if (self) {
        dashColor = [UIColor blackColor];
        dashLineWidth = 4.0f;
        dashLineSpace = 2.0f;
        horizontal = YES;
    }
    return self;
}

- (void)setDashColor:(UIColor *)color
{
    dashColor = color;
    [self setNeedsDisplay];
}

- (void)setDashLineWidth:(CGFloat)width
{
    dashLineWidth = width;
    [self setNeedsDisplay];
}

- (void)setDashLineSpace:(CGFloat)space
{
    dashLineSpace = space;
    [self setNeedsDisplay];
}

- setHorizontal:(BOOL)hor {
    horizontal = hor;
    [self setNeedsDisplay];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat width = CGRectGetWidth(self.bounds);
    
    CGContextRef cx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(cx);
    CGContextSetLineWidth(cx, horizontal ? height : width);
    CGContextSetStrokeColorWithColor(cx, dashColor.CGColor);

    CGFloat dash[] = {dashLineWidth, dashLineSpace};
    CGContextSetLineDash(cx, 0, dash, 2);

    if (horizontal) {
        CGContextMoveToPoint(cx, 0, height / 2);
        CGContextAddLineToPoint(cx, width, height / 2);
    } else {
        CGContextMoveToPoint(cx, width / 2, 0);
        CGContextAddLineToPoint(cx, width / 2, height);
    }
    CGContextStrokePath(cx);
    CGContextClosePath(cx);
}

@end
