//
//  XYFProgressLayer.m
//  m10186d20499d3a7cf84e757c710db8a9b
//
//  Created by m1748c0644a50090814d3e170723ccc5cb on 2018/6/4.
//  Copyright © 2018 ma511b124024ef67ced53eb81e3821a0ab. All rights reserved.
//

#import "XYFProgressLayer.h"

@interface XYFProgressLayer ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) CGFloat stepWidth;
@property (nonatomic, assign) CGFloat lineHeight;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

static NSTimeInterval const progressInterval = 0.001;

@implementation XYFProgressLayer

- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, XYF_DEVICE_WIDTH, 2)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame color:[UIColor whiteColor]];
}

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
    if (self = [super init]) {
        self.frame = frame;
        self.stepWidth = 0.001;
        _lineHeight = frame.size.height;
        [self initPathWithWidth:_lineHeight];
    }
    return self;
}

- (void)initPathWithWidth:(CGFloat)width {
    self.lineWidth = width;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, width)];
    [path addLineToPoint:CGPointMake(XYF_DEVICE_WIDTH, width)];
    self.path = path.CGPath;
    self.strokeEnd = 0;
}

- (void)setProgressStyle:(XYFProgressStyle)progressStyle {
    _progressStyle = progressStyle;
    if (progressStyle & XYFProgressStyle_Gradual) {
        self.strokeColor = nil;
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        CGFloat RGB[3];
        [self getRGBComponents:RGB forColor:_progressColor];
        gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:RGB[0] green:RGB[1] blue:RGB[2] alpha:0.3].CGColor, (__bridge id)_progressColor.CGColor];
        gradientLayer.locations = @[@(0), @(0)];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
        gradientLayer.frame = CGRectMake(0, 0, 0, _lineHeight);
        _gradientLayer = gradientLayer;
        [self addSublayer:gradientLayer];
    }
}

- (void)setProgressColor:(UIColor *)progressColor {
    _progressColor = progressColor;
    if (_progressStyle == XYFProgressStyle_Noraml) {
        self.strokeColor = progressColor.CGColor;
    } else {
        self.progressStyle = XYFProgressStyle_Gradual;
    }
}

#pragma mark - timer action

- (void)progressChanged:(NSTimer *)timer {
    self.strokeEnd += _stepWidth;
    
    if (self.strokeEnd > 0.7) {
        _stepWidth = 0.00001;
    }
    
    if (self.strokeEnd > 0.9) {
        _stepWidth = 0;
    }
    
    if (_progressStyle == XYFProgressStyle_Gradual) {
        _gradientLayer.locations = @[@(self.strokeEnd/2), @(self.strokeEnd)];
        _gradientLayer.frame = CGRectMake(0, 0, XYF_DEVICE_WIDTH * self.strokeEnd, _lineHeight);
    }
}

- (void)progressAnimationStart {
    self.hidden = NO;
    if (_timer) {
        [self invalidateTimer];
    }
    _timer = [NSTimer timerWithTimeInterval:progressInterval target:self selector:@selector(progressChanged:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)progressAnimationCompletion {
    [self invalidateTimer];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(progressChanged:) object:nil];
    self.strokeEnd = 1.0;
    if (_progressStyle == XYFProgressStyle_Gradual) {
        _gradientLayer.locations = @[@(self.strokeEnd/2), @(self.strokeEnd)];
        _gradientLayer.frame = CGRectMake(0, 0, XYF_DEVICE_WIDTH * self.strokeEnd, _lineHeight);
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
        self->_stepWidth = 0.001;
        self.strokeEnd = 0;
        self->_gradientLayer.locations = @[@(self.strokeEnd/2), @(self.strokeEnd)];
        self->_gradientLayer.frame = CGRectMake(0, 0, 0, self->_lineHeight);
    });
}

- (void)invalidateTimer {
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - private method

- (void)getRGBComponents:(CGFloat [3])components forColor:(UIColor *)color {
    if (!color) {
        components[0] = 1;
        components[1] = 1;
        components[2] = 1;
        return;
    }
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel, 1, 1, 8, 4, rgbColorSpace, kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component] / 255.0f;
    }
}

@end
