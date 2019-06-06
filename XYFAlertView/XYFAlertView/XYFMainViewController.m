//
//  XYFMainViewController.m
//  NewProjects
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 DSOperation. All rights reserved.
//

#import "XYFMainViewController.h"
#import "XYFAlertView.h"
#import "XYFProgressLayer.h"
#import "UIWebView+XYFProgress.h"
#import "XYFCleanCache.h"
#import "MBProgressHUD.h"

@interface XYFMainViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *ldView;

@end

@implementation XYFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    self.ldView  = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 45)];
    self.ldView.scalesPageToFit = YES;
    self.ldView.delegate = self;
    [self.view addSubview:self.ldView];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.strBy]];
    [self.ldView loadRequest:req];
    
    self.ldView.xyf_progressLayer = [[XYFProgressLayer alloc] initWithFrame:CGRectMake(0, 0, XYF_DEVICE_WIDTH, 2.0f)];
    self.ldView.xyf_progressLayer.progressColor = [UIColor greenColor];
    self.ldView.xyf_progressLayer.progressStyle = XYFProgressStyle_Noraml;
    [self.view.layer addSublayer:self.ldView.xyf_progressLayer];
    
    [self setupButtonView];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - WebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *requestString = request.URL.absoluteString;
    if ([requestString hasPrefix:@"alipays://"] || [requestString hasPrefix:@"alipay://"] || [requestString hasPrefix:@"mqqapi://"] || [requestString hasPrefix:@"mqqapis://"] || [requestString hasPrefix:@"weixin://"] || [requestString hasPrefix:@"weixins://"])  {
        BOOL result = [[UIApplication sharedApplication]openURL:request.URL];
        if (!result) {
            [XYFAlertView showAlertWithTitle:@"温馨提示" subtitle:@"未检测到客户端,请前往App Store下载" subtitleColor:nil isLeftButtonRed:YES buttonTitles:@[@"确定"] leftButtonClickAction:nil rightButtonClickAction:nil];
        }
        return NO;
    }
    return YES;
}

- (void)setupButtonView {
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds) - 45, CGRectGetWidth([UIScreen mainScreen].bounds), 45)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    for (NSInteger i = 0; i < 5; i++) {
        UIButton *bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        bottomButton.tag = 57 + i;
        [bottomButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bottom_btn_icon_%zd", i]] forState:UIControlStateNormal];
        CGFloat buttonWidth = CGRectGetWidth([UIScreen mainScreen].bounds) / 5.0;
        CGFloat buttonHeight = CGRectGetHeight(bottomView.frame);
        bottomButton.frame = CGRectMake(buttonWidth * i, 0, buttonWidth, buttonHeight);
        [bottomButton addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:bottomButton];
    }
}

- (void)bottomButtonClick:(UIButton *)button{
    switch (button.tag) {
        case 57: {
            [self.ldView goBack];
            break;
        }
        case 58: {
            [self.ldView goForward];
            break;
        }
        case 59: {
            [self.ldView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.strBy]]];
            break;
        }
        case 60: {
            [self.ldView reload];
            break;
        }
        case 61: {
            [self clearRubbish];
            break;
        }
            
        default:
            break;
    }
}

- (void)clearRubbish {
    float cacheSize = [XYFCleanCache folderSizeAtPath];
    NSString *cleanMessage = nil;
    if (cacheSize >= 1) {
        cleanMessage = [NSString stringWithFormat:@"清理成功，共清理%.2fMB垃圾", [XYFCleanCache folderSizeAtPath]];
    } else {
        cleanMessage = @"已经很干净了";
    }
    
    [XYFCleanCache cleanCache:^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = cleanMessage;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    }];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
