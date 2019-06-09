//
//  UIWebView+XYFProgress.h
//  m10186d20499d3a7cf84e757c710db8a9b
//
//  Created by m1748c0644a50090814d3e170723ccc5cb on 2018/6/4.
//  Copyright © 2018 ma511b124024ef67ced53eb81e3821a0ab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYFProgressLayer;

@interface UIWebView (XYFProgress)

@property (nonatomic, strong) XYFProgressLayer *xyf_progressLayer;

@property (nonatomic, assign) BOOL xyf_showProgressLayer;

@end
