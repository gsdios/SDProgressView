//
//  SDDemoItemView.h
//  SDProgressView
//
//  Created by aier on 15-2-20.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDBaseProgressView.h"

@interface SDDemoItemView : UIView

@property (nonatomic, assign) Class progressViewClass;

@property (nonatomic, strong) SDBaseProgressView *progressView;

+ (id)demoItemViewWithClass:(Class)class;

@end
