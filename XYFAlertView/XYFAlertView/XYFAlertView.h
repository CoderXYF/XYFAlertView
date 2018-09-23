//
//  XYFAlertView.h
//  NewProjects
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 DSOperation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYFAlertView : UIView

/**
 初始化弹出操作框，最多支持2个按钮

 @param title 操作框标题
 @param subtitle 操作框副标题
 @param subtitleColor 操作框副标题颜色
 @param isLeftButtonRed 按钮是否是左红右白
 @param buttonTitles 按钮标题数组（从左至右）
 @param leftButtonClickAction 左边（第一个）按钮点击监听
 @param rightButtonClickAction 右边（第二个）按钮点击监听
 */
+ (void)showAlertWithTitle:(NSString *)title subtitle:(NSString *)subtitle subtitleColor:(UIColor *)subtitleColor isLeftButtonRed:(BOOL)isLeftButtonRed buttonTitles:(NSArray *)buttonTitles leftButtonClickAction:(void(^)(void))leftButtonClickAction rightButtonClickAction:(void(^)(void))rightButtonClickAction;
/// 取消弹出操作框
+ (void)dismiss;

@end
