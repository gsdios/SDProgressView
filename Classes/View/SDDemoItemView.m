//
//  SDDemoItemView.m
//  SDProgressView
//
//  Created by aier on 15-2-20.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDDemoItemView.h"

@implementation SDDemoItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
    }
    return self;
}

- (void)setProgressViewClass:(Class)progressViewClass
{
    _progressViewClass = progressViewClass;
    self.progressView = [[progressViewClass alloc] init];
    [self addSubview:self.progressView];
}

- (void)tap
{
    UILabel *label = [[UILabel alloc] init];
    label.bounds = CGRectMake(0, 0, 260, 40);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = NSStringFromClass(self.progressViewClass);
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    label.backgroundColor = SDColorMaker(255, 255, 255, 0.7);
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:label];
    label.center = keyWindow.center;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
    });
}


+ (id)demoItemViewWithClass:(Class)class
{
    SDDemoItemView *demo = [[self alloc] init];
    demo.progressViewClass = class;
    return demo;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.progressView.frame = self.bounds;
}

@end
