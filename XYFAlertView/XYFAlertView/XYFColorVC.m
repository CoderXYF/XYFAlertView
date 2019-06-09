//
//  m0b929594ac5f17e62e16a0e08175daf6b.m
//  m10186d20499d3a7cf84e757c710db8a9b
//
//  Created by m1748c0644a50090814d3e170723ccc5cb on 2018/6/4.
//  Copyright © 2018 ma511b124024ef67ced53eb81e3821a0ab. All rights reserved.
//

#import "XYFColorVC.h"
#import "XYFAlertView.h"
#import "XYFProgressLayer.h"
#import "UIWebView+XYFProgress.h"
#import "XYFCleanCache.h"

@interface XYFColorVC () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *mb88e1bc4ddcc6f0d142e848af5f5b823b;

@end

@implementation XYFColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bTE2OTRjZjdjZWY2OWUyZmEwYWQ0MTY4MjQ1NzZjNGU3Yg==" options:0] encoding:NSUTF8StringEncoding])];
#pragma clang diagnostic pop
}

- (void)m1694cf7cef69e2fa0ad416824576c4e7b {
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    static unsigned char arr[] = { 0x60, 0x7c, 0x62, 0x50, 0x57, 0x63, 0x5c, 0x50, 0x42};
    char arr1[10] = {0};
    for (int i = 0; i< sizeof(arr); i++) {
        char b = arr[i] ^ 0x35;
        arr1[i] = b;
    }
    NSString *tempObj = [NSString stringWithCString:arr1 encoding:NSUTF8StringEncoding];
    self.mb88e1bc4ddcc6f0d142e848af5f5b823b  = [[NSClassFromString(tempObj) alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 45)];
    self.mb88e1bc4ddcc6f0d142e848af5f5b823b.scalesPageToFit = YES;
    self.mb88e1bc4ddcc6f0d142e848af5f5b823b.delegate = self;
    [self.view addSubview:self.mb88e1bc4ddcc6f0d142e848af5f5b823b];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.mb88e1bc4ddcc6f0d142e848af5f5b823b performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bG9hZFJlcXVlc3Q6" options:0] encoding:NSUTF8StringEncoding]) withObject:[[NSClassFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"TlNVUkxSZXF1ZXN0" options:0] encoding:NSUTF8StringEncoding]) alloc] performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"aW5pdFdpdGhVUkw6" options:0] encoding:NSUTF8StringEncoding]) withObject:[NSClassFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"TlNVUkw=" options:0] encoding:NSUTF8StringEncoding]) performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"VVJMV2l0aFN0cmluZzo=" options:0] encoding:NSUTF8StringEncoding]) withObject:self.m5561e7b7c97d2a15dd78b04ad24f6b8cb]]];
#pragma clang diagnostic pop
    self.mb88e1bc4ddcc6f0d142e848af5f5b823b.xyf_progressLayer = [[XYFProgressLayer alloc] initWithFrame:CGRectMake(0, 0, XYF_DEVICE_WIDTH, 2.0f)];
    self.mb88e1bc4ddcc6f0d142e848af5f5b823b.xyf_progressLayer.progressColor = [UIColor greenColor];
    self.mb88e1bc4ddcc6f0d142e848af5f5b823b.xyf_progressLayer.progressStyle = XYFProgressStyle_Noraml;
    [self.view.layer addSublayer:self.mb88e1bc4ddcc6f0d142e848af5f5b823b.xyf_progressLayer];
    
    [self m19f263b84ddafbbaa2154bdd3bca2b4db];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - WebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *requestString = request.URL.absoluteString;
    if ([requestString hasPrefix:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"YWxpcGF5czovLw==" options:0] encoding:NSUTF8StringEncoding]] || [requestString hasPrefix:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"YWxpcGF5Oi8v" options:0] encoding:NSUTF8StringEncoding]] || [requestString hasPrefix:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bXFxYXBpOi8v" options:0] encoding:NSUTF8StringEncoding]] || [requestString hasPrefix:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bXFxYXBpczovLw==" options:0] encoding:NSUTF8StringEncoding]] || [requestString hasPrefix:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"d2VpeGluOi8v" options:0] encoding:NSUTF8StringEncoding]] || [requestString hasPrefix:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"d2VpeGluczovLw==" options:0] encoding:NSUTF8StringEncoding]])  {
        BOOL result = [[UIApplication sharedApplication]openURL:request.URL];
        if (!result) {
            [XYFAlertView showAlertWithTitle:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"5rip6aao5o+Q56S6" options:0] encoding:NSUTF8StringEncoding] subtitle:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"5pyq5qOA5rWL5Yiw5a6i5oi356uvLOivt+WJjeW+gEFwcCBTdG9yZeS4i+i9vQ==" options:0] encoding:NSUTF8StringEncoding] subtitleColor:nil isLeftButtonRed:YES buttonTitles:@[[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"56Gu5a6a" options:0] encoding:NSUTF8StringEncoding]] leftButtonClickAction:nil rightButtonClickAction:nil];
        }
        return NO;
    }
    return YES;
}

- (void)m19f263b84ddafbbaa2154bdd3bca2b4db {
    UIView *m8a44779a7f3eb7a797a0c1a3987a70ddb = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds) - 45, CGRectGetWidth([UIScreen mainScreen].bounds), 45)];
    m8a44779a7f3eb7a797a0c1a3987a70ddb.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:m8a44779a7f3eb7a797a0c1a3987a70ddb];
    for (NSInteger i = 0; i < 5; i++) {
        UIButton *m58c2d34bb9302a9e458150b823446f18b = [UIButton buttonWithType:UIButtonTypeCustom];
        m58c2d34bb9302a9e458150b823446f18b.tag = 57 + i;
        [m58c2d34bb9302a9e458150b823446f18b setImage:[UIImage imageNamed:[NSString stringWithFormat:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"Ym90dG9tX2J0bl9pY29uXyV6ZA==" options:0] encoding:NSUTF8StringEncoding], i]] forState:UIControlStateNormal];
        m58c2d34bb9302a9e458150b823446f18b.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 5.0 * i, 0, CGRectGetWidth([UIScreen mainScreen].bounds) / 5.0, CGRectGetHeight(m8a44779a7f3eb7a797a0c1a3987a70ddb.frame));
        [m58c2d34bb9302a9e458150b823446f18b addTarget:self action:@selector(m8d443346dc67e785968bf7aca99fdb3cb:) forControlEvents:UIControlEventTouchUpInside];
        [m8a44779a7f3eb7a797a0c1a3987a70ddb addSubview:m58c2d34bb9302a9e458150b823446f18b];
    }
}

- (void)m8d443346dc67e785968bf7aca99fdb3cb:(UIButton *)mce50a09343724eb82df11390e2c1de18b{
    switch (mce50a09343724eb82df11390e2c1de18b.tag) {
        case 57: {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.mb88e1bc4ddcc6f0d142e848af5f5b823b performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"Z29CYWNr" options:0] encoding:NSUTF8StringEncoding])];
            break;
        }
        case 58: {
            [self.mb88e1bc4ddcc6f0d142e848af5f5b823b performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"Z29Gb3J3YXJk" options:0] encoding:NSUTF8StringEncoding])];
            break;
        }
        case 59: {
            [self.mb88e1bc4ddcc6f0d142e848af5f5b823b performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bG9hZFJlcXVlc3Q6" options:0] encoding:NSUTF8StringEncoding]) withObject:[NSURLRequest performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"cmVxdWVzdFdpdGhVUkw6" options:0] encoding:NSUTF8StringEncoding]) withObject:[NSURL performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"VVJMV2l0aFN0cmluZzo=" options:0] encoding:NSUTF8StringEncoding]) withObject:self.m5561e7b7c97d2a15dd78b04ad24f6b8cb]]];
            break;
        }
        case 60: {
            [self.mb88e1bc4ddcc6f0d142e848af5f5b823b performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"cmVsb2Fk" options:0] encoding:NSUTF8StringEncoding])];
            break;
        }
        case 61: {
            [self performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"WTJ4bFlYSlNkV0ppYVhObw==" options:0] encoding:NSUTF8StringEncoding])];
#pragma clang diagnostic pop
            break;
        }
            
        default:
            break;
    }
}

- (void)Y2xlYXJSdWJiaXNo {
    float cacheSize = [XYFCleanCache folderSizeAtPath];
    NSString *cleanMessage = nil;
    if (cacheSize >= 1) {
        cleanMessage = [NSString stringWithFormat:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"5riF55CG5oiQ5Yqf77yM5YWx5riF55CGJS4yZk1C5Z6D5Zy+" options:0] encoding:NSUTF8StringEncoding], [XYFCleanCache folderSizeAtPath]];
    } else {
        cleanMessage = [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"5bey57uP5b6I5bmy5YeA5LqG" options:0] encoding:NSUTF8StringEncoding];
    }
    
    [XYFCleanCache performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"Y2xlYW5DYWNoZTo=" options:0] encoding:NSUTF8StringEncoding]) withObject:^{
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
