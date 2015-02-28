//
//  SDPieProgressView.m
//  SDProgressView
//
//  Created by aier on 15-2-19.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDPieProgressView.h"

@implementation SDPieProgressView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - SDProgressViewItemMargin;
    
    // 背景圆
    [SDColorMaker(240, 240, 240, 1) set];
    CGFloat w = radius * 2 + 4;
    CGFloat h = w;
    CGFloat x = (rect.size.width - w) * 0.5;
    CGFloat y = (rect.size.height - h) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
    CGContextFillPath(ctx);
    
    // 进程圆
    [SDColorMaker(150, 150, 150, 0.8) set];
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGContextAddLineToPoint(ctx, xCenter, 0);
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 1);
    CGContextClosePath(ctx);
    
    CGContextFillPath(ctx);
}

@end
