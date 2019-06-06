//
//  UIWebView+XYFProgress.h
//  NewProjects
//
//  Created by XYF on 2018/6/4.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYFProgressLayer;

@interface UIWebView (XYFProgress)

@property (nonatomic, strong) XYFProgressLayer *xyf_progressLayer;
/** 是否显示加载进度条, 默认YES */
@property (nonatomic, assign) BOOL xyf_showProgressLayer;

- (void)xyf_showCustomProgressView;

@end
