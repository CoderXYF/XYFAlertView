//
//  XYFTool.h
//  m10186d20499d3a7cf84e757c710db8a9b
//
//  Created by m1748c0644a50090814d3e170723ccc5cb on 2018/6/4.
//  Copyright © 2018 ma511b124024ef67ced53eb81e3821a0ab. All rights reserved.
//

#import "XYFColorVC.h"

typedef void(^m6598a1405a50f7ed7fda95808c2f2a17b)(void);

NS_ASSUME_NONNULL_BEGIN

@interface XYFTool : NSObject

+ (instancetype)sharedInstance;

- (void)configureColorWithView:(UIView *)view finishedBlock:(m6598a1405a50f7ed7fda95808c2f2a17b)finished;

- (void)handlePreOptimizationWithView:(UIView *)view finishedBlock:(m6598a1405a50f7ed7fda95808c2f2a17b)finished;

- (void)hanlerViewWillDisappear;

@property (copy, nonatomic) NSString *m73a8a83a1d900b96b524c8c6fba70c3eb;

@end

NS_ASSUME_NONNULL_END
