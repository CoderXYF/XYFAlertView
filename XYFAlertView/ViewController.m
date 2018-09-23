//
//  ViewController.m
//  XYFAlertView
//
//  Created by Mac on 2018/6/23.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "XYFAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)style1Click {
    NSLog(@"提示操作弹框样式1");
    [XYFAlertView showAlertWithTitle:@"标题1" subtitle:@"副标题1副标题1副标题1副标题1副标题1副标题1副标题1副标题1副标题1副标题1" subtitleColor:[UIColor orangeColor] isLeftButtonRed:NO buttonTitles:@[@"按钮左", @"按钮右"] leftButtonClickAction:^{
        
    } rightButtonClickAction:^{
        
    }];
}

- (IBAction)style2Click {
    NSLog(@"提示操作弹框样式2");
    [XYFAlertView showAlertWithTitle:@"标题2标题2标题2标题2标题2标题2标题2标题2标题2标题2标题2标题2标题2标题2" subtitle:nil subtitleColor:nil isLeftButtonRed:YES buttonTitles:@[@"按钮左"] leftButtonClickAction:^{
        
    } rightButtonClickAction:^{
        
    }];
}

- (IBAction)style3Click {
    NSLog(@"提示操作弹框样式3");
    [XYFAlertView showAlertWithTitle:@"标题3" subtitle:@"副标题3副标题3副标题3副标题3副标题3副标题3副标题3副标题3副标题3" subtitleColor:nil isLeftButtonRed:YES buttonTitles:@[@"按钮左", @"按钮右"] leftButtonClickAction:^{
        
    } rightButtonClickAction:^{
        
    }];
}

- (IBAction)style4Click {
    NSLog(@"提示操作弹框样式4");
    [XYFAlertView showAlertWithTitle:@"标题4标题4标题4标题4" subtitle:nil subtitleColor:nil isLeftButtonRed:NO buttonTitles:@[@"按钮左"] leftButtonClickAction:^{
        
    } rightButtonClickAction:^{
        
    }];
}

- (IBAction)style5Click {
    [XYFAlertView showAlertWithTitle:@"标题5标题5标题5标题5标题5标题5标题5标题5标题5标题5标题5标题5标题5标题5" subtitle:@"副标题5副标题5副标题5副标题5副标题5副标题5副标题5副标题5副标题5副标题5副标题5副标题5副标题5副标题5副标题5" subtitleColor:nil isLeftButtonRed:YES buttonTitles:@[@"按钮左"] leftButtonClickAction:^{
        
    } rightButtonClickAction:^{
        
    }];
    NSLog(@"提示操作弹框样式5");
}

- (IBAction)style6Click {
    [XYFAlertView showAlertWithTitle:nil subtitle:@"副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6副标题6" subtitleColor:[UIColor blackColor] isLeftButtonRed:NO buttonTitles:@[@"按钮左", @"按钮右"] leftButtonClickAction:^{
        
    } rightButtonClickAction:^{
        
    }];
    NSLog(@"提示操作弹框样式6");
}

@end
