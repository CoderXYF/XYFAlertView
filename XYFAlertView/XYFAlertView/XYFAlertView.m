//
//  XYFAlertView.m
//  NewProjects
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 DSOperation. All rights reserved.
//

#import "XYFAlertView.h"

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define Normal_Space 15
#define Normal_Font [UIFont systemFontOfSize:15.f]
#define Middle_Font [UIFont systemFontOfSize:14.f]

static UIView *mainBgView = nil;
static UIView *alertBgView = nil;
static void(^leftButtonClickActionBlock)(void) = nil;
static void(^rightButtonClickActionBlock)(void) = nil;

@implementation XYFAlertView

+ (void)showAlertWithTitle:(NSString *)title subtitle:(NSString *)subtitle subtitleColor:(UIColor *)subtitleColor isLeftButtonRed:(BOOL)isLeftButtonRed buttonTitles:(NSArray *)buttonTitles leftButtonClickAction:(void(^)(void))leftButtonClickAction rightButtonClickAction:(void(^)(void))rightButtonClickAction {
    leftButtonClickActionBlock = leftButtonClickAction;
    rightButtonClickActionBlock = rightButtonClickAction;
    
    mainBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    mainBgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    
    alertBgView = [[UIView alloc] init];
    alertBgView.backgroundColor = [UIColor whiteColor];
    alertBgView.frame = CGRectMake((ScreenWidth - 296) * 0.5, (ScreenHeight - (subtitle.length?158:132)) * 0.5, 296, subtitle.length?158:132);
    alertBgView.layer.cornerRadius = 9;
    alertBgView.layer.masksToBounds = YES;
    [mainBgView addSubview:alertBgView];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.numberOfLines = 0;
    [titleLabel sizeToFit];
    CGFloat originalWidth = titleLabel.bounds.size.width;
    CGRect titleLabelFrame = titleLabel.frame;
    titleLabelFrame.size.width = alertBgView.bounds.size.width - Normal_Space * 2;
    titleLabel.frame = titleLabelFrame;
    if (originalWidth < titleLabel.bounds.size.width) {
        titleLabel.textAlignment = NSTextAlignmentCenter;
    } else {
        [titleLabel sizeToFit];
        titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    CGRect titleLabelFrame_1 = titleLabel.frame;
    titleLabelFrame_1.origin.x = Normal_Space;
    titleLabel.frame = titleLabelFrame_1;
    CGRect titleLabelFrame_2 = titleLabel.frame;
    titleLabelFrame_2.origin.y = 23;
    titleLabel.frame = titleLabelFrame_2;
    [alertBgView addSubview:titleLabel];
    
    // 副标题
    UILabel *subtitleLabel = [[UILabel alloc] init];
    subtitleLabel.text = subtitle;
    subtitleLabel.font = Normal_Font;
    subtitleLabel.textColor = subtitleColor ? subtitleColor : [UIColor colorWithRed:93/255.0 green:93/255.0 blue:93/255.0 alpha:1.0];
    subtitleLabel.numberOfLines = 0;
    [subtitleLabel sizeToFit];
    CGFloat subtitleOriginalWidth = subtitleLabel.bounds.size.width;
    CGRect subtitleLabelFrame = subtitleLabel.frame;
    subtitleLabelFrame.size.width = alertBgView.bounds.size.width - Normal_Space * 2;
    subtitleLabel.frame = subtitleLabelFrame;
    if (subtitleOriginalWidth < subtitleLabel.bounds.size.width) {
        subtitleLabel.textAlignment = NSTextAlignmentCenter;
    } else {
        [subtitleLabel sizeToFit];
        subtitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    CGRect subtitleLabelFrame_1 = subtitleLabel.frame;
    subtitleLabelFrame_1.origin.x = Normal_Space;
    subtitleLabel.frame = subtitleLabelFrame_1;
    CGRect subtitleLabelFrame_2 = subtitleLabel.frame;
    subtitleLabelFrame_2.origin.y = CGRectGetMaxY(titleLabel.frame) + 10;
    subtitleLabel.frame = subtitleLabelFrame_2;
    [alertBgView addSubview:subtitleLabel];
    
    CGRect alertBgViewFrame = alertBgView.frame;
    alertBgViewFrame.size.height += (titleLabel.bounds.size.height - 21.5);
    alertBgView.frame = alertBgViewFrame;
    if (subtitle.length) {
        CGRect alertBgViewFrame_1 = alertBgView.frame;
        alertBgViewFrame_1.size.height += (subtitleLabel.bounds.size.height - 18);
        alertBgView.frame = alertBgViewFrame_1;
    }
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(buttonTitles.count > 1 ? 26 : 88, alertBgView.bounds.size.height - 27 - 29, 107, 29);
    [leftButton setTitle:buttonTitles.count?buttonTitles[0]:@"" forState:UIControlStateNormal];
    [leftButton setTitleColor:isLeftButtonRed?[UIColor whiteColor]:[UIColor blackColor] forState:UIControlStateNormal];
    leftButton.titleLabel.font = Middle_Font;
    leftButton.backgroundColor = isLeftButtonRed?[UIColor redColor]:[UIColor whiteColor];
    leftButton.layer.cornerRadius = leftButton.bounds.size.height * 0.5;
    leftButton.layer.masksToBounds = YES;
    if (!isLeftButtonRed) {
        leftButton.layer.borderWidth = 1;
        leftButton.layer.borderColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0].CGColor;
    }
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [alertBgView addSubview:leftButton];
    
    if (buttonTitles.count > 1) {
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(alertBgView.bounds.size.width - 26 - leftButton.bounds.size.width, leftButton.frame.origin.y, leftButton.bounds.size.width, leftButton.bounds.size.height);
        [rightButton setTitle:buttonTitles[1] forState:UIControlStateNormal];
        [rightButton setTitleColor:isLeftButtonRed?[UIColor redColor]:[UIColor whiteColor] forState:UIControlStateNormal];
        rightButton.titleLabel.font = Middle_Font;
        rightButton.backgroundColor = isLeftButtonRed?[UIColor whiteColor]:[UIColor redColor];
        rightButton.layer.cornerRadius = rightButton.bounds.size.height * 0.5;
        rightButton.layer.masksToBounds = YES;
        if (isLeftButtonRed) {
            rightButton.layer.borderWidth = 1;
            rightButton.layer.borderColor = [UIColor redColor].CGColor;
        }
        [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [alertBgView addSubview:rightButton];
    }
    alertBgView.frame = CGRectMake((ScreenWidth - alertBgView.bounds.size.width) * 0.5, (ScreenHeight - alertBgView.bounds.size.height) * 0.5, alertBgView.bounds.size.width, alertBgView.bounds.size.height);
    // show
    [[UIApplication sharedApplication].keyWindow addSubview:mainBgView];
}

+ (void)leftButtonClick {
    if (leftButtonClickActionBlock) {
        leftButtonClickActionBlock();
    }
    [self dismiss];
}

+ (void)rightButtonClick {
    if (rightButtonClickActionBlock) {
        rightButtonClickActionBlock();
    }
    [self dismiss];
}

+ (void)dismiss {
    [mainBgView removeFromSuperview];
    mainBgView = nil;
    alertBgView = nil;
    leftButtonClickActionBlock = nil;
    rightButtonClickActionBlock = nil;
}

@end
