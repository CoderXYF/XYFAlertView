//
//  XYFProgressLayer.h
//  m10186d20499d3a7cf84e757c710db8a9b
//
//  Created by m1748c0644a50090814d3e170723ccc5cb on 2018/6/4.
//  Copyright © 2018 ma511b124024ef67ced53eb81e3821a0ab. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#define XYF_DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width

typedef NS_ENUM(NSUInteger, XYFProgressStyle) {
    XYFProgressStyle_Noraml,
    XYFProgressStyle_Gradual,
};

@interface XYFProgressLayer : CAShapeLayer

@property (nonatomic, assign) XYFProgressStyle progressStyle;

@property (nonatomic, strong) UIColor *progressColor;

- (instancetype)initWithFrame:(CGRect)frame;

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;

- (void)progressAnimationStart;

- (void)progressAnimationCompletion;

@end
