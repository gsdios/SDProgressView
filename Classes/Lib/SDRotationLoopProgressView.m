//
//  SDRotationLoopProgressView.m
//  SDProgressView
//
//  Created by aier on 15-2-20.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDRotationLoopProgressView.h"

// 加载时显示的文字
NSString * const SDRotationLoopProgressViewWaitingText = @"LOADING...";

@implementation SDRotationLoopProgressView
{
    CGFloat _angleInterval;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(changeAngle) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)changeAngle
{
    _angleInterval += M_PI * 0.08;
    if (_angleInterval >= M_PI * 2) _angleInterval = 0;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [[UIColor lightGrayColor] set];
    
    CGContextSetLineWidth(ctx, 4);
    CGFloat to = - M_PI * 0.06 + _angleInterval; // 初始值0.05
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - SDProgressViewItemMargin;
    CGContextAddArc(ctx, xCenter, yCenter, radius, _angleInterval, to, 0);
    CGContextStrokePath(ctx);
    
    // 加载时显示的文字
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:13 * SDProgressViewFontScale];
    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [self setCenterProgressText:SDRotationLoopProgressViewWaitingText withAttributes:attributes];
}

@end
