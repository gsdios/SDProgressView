//
//  SDViewController.m
//  SDProgressView
//
//  Created by aier on 15-2-19.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDViewController.h"
#import "SDProgressView.h"
#import "SDDemoItemView.h"

@interface SDViewController ()
@property (nonatomic, strong) NSMutableArray *demoViews;
@end

@implementation SDViewController

- (NSMutableArray *)demoViews
{
    if (_demoViews == nil) {
        _demoViews = [NSMutableArray array];
    }
    return _demoViews;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置背景图片和提示标题
    [self setupBgAndTitle];
    
    // 添加progressView示例模型图
    [self addDemoItemViews];

    // 调整示例frame
    [self setupSubviews];
    
    // 模拟下载进度
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(progressSimulation) userInfo:self repeats:YES];
}

- (void)setupBgAndTitle
{
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"005.jpg"]];
    bgView.frame = self.view.bounds;
    [self.view addSubview:bgView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.bounds = CGRectMake(0, 0, 240, 20);
    titleLabel.center = CGPointMake(self.view.center.x, 24);
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"点击即可显示对应类名";
    [self.view addSubview:titleLabel];

}

- (void)addDemoItemViews
{
    // 此处为示例模型，为演示并在点击时展示相应类名使用（使用进度指示器不要做此部操作！！！）
    
    [self.demoViews addObject:[SDDemoItemView demoItemViewWithClass:[SDPieProgressView class]]];
    [self.demoViews addObject:[SDDemoItemView demoItemViewWithClass:[SDLoopProgressView class]]];
    [self.demoViews addObject:[SDDemoItemView demoItemViewWithClass:[SDBallProgressView class]]];
    [self.demoViews addObject:[SDDemoItemView demoItemViewWithClass:[SDPieLoopProgressView class]]];
    [self.demoViews addObject:[SDDemoItemView demoItemViewWithClass:[SDTransparentPieProgressView class]]];
    [self.demoViews addObject:[SDDemoItemView demoItemViewWithClass:[SDRotationLoopProgressView class]]];
}

- (void)setupSubviews
{
    int perrowCount= 2;
    CGFloat w = 100;
    CGFloat h = w;
    CGFloat margin = (self.view.frame.size.width - perrowCount * w) / (perrowCount + 1);
    [self.demoViews enumerateObjectsUsingBlock:^(SDDemoItemView *demoView, NSUInteger idx, BOOL *stop) {
        int rowIndex = idx / perrowCount;
        int columnIndex = idx % perrowCount;
        CGFloat x = margin + (w + margin) * columnIndex;
        CGFloat y = margin + (h + margin) * rowIndex;
        demoView.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:demoView];
    }];
}


- (void)progressSimulation
{
    static CGFloat progress = 0;
    
    if (progress < 1.0) {
        progress += 0.01;
        
        // 循环
        if (progress >= 1.0) progress = 0;
        
        [self.demoViews enumerateObjectsUsingBlock:^(SDDemoItemView *demoView, NSUInteger idx, BOOL *stop) {
            demoView.progressView.progress = progress;
        }];
    }
}


@end
