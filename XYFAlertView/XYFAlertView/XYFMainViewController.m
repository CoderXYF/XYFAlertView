//
//  XYFMainViewController.m
//  NewProjects
//
//  Created by feijiu_1 on 2019/4/18.
//  Copyright © 2019年 DSOperation. All rights reserved.
//

#import "XYFMainViewController.h"
#import "WYWebProgressLayer.h"
#import "NSString+Addtion.h"
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
@interface XYFMainViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView  * webView;
@property(nonatomic,strong)WYWebProgressLayer *progressLayer;
@end

@implementation XYFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    _webView  = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 45)];
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    _webView.delegate=self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
    [self CreatBottom];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _progressLayer = [WYWebProgressLayer new];
    _progressLayer.frame = CGRectMake(0, 1, SCREEN_WIDTH, 2);
    [self.view.layer addSublayer:_progressLayer];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // NOTE: ------  对alipays:相关的scheme处理 -------
    // NOTE: 若遇到支付宝相关scheme，则跳转到本地支付宝App
    NSString* reqUrl = request.URL.absoluteString;
    if ([reqUrl hasPrefix:@"alipays://"] || [reqUrl hasPrefix:@"alipay://"] || [reqUrl hasPrefix:@"mqqapi://"] || [reqUrl hasPrefix:@"mqqapis://"] || [reqUrl hasPrefix:@"weixin://"] || [reqUrl hasPrefix:@"weixins://"])  {
        // NOTE: 跳转支付宝App
        BOOL bSucc = [[UIApplication sharedApplication]openURL:request.URL];
        // NOTE: 如果跳转失败，则跳转itune下载支付宝App
        if (!bSucc) {
            UIAlertController * actionView = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到客户端,请前往App Store下载" preferredStyle:1];
            UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:0 handler:nil];
            [actionView addAction:action];
            [self presentViewController:actionView animated:YES completion:nil];
        }
        return NO;
    }
    return YES;
}
//底部按钮
-(void)CreatBottom{
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 45, self.view.frame.size.width, 45)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    NSArray * btnArr = @[@"btn1",@"btn2",@"btn3",@"btn4",@"btn5"];
    int k =40;
    int g =40;
    int d = (ScreenWidth-k*btnArr.count)/(btnArr.count+1);
    for (int i = 0; i<btnArr.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:btnArr[i]] forState:0];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:btn];
        btn.frame = CGRectMake(d+(d+k)*i, 2.5, k, g);
    }
}

-(void)btnClick:(UIButton*)btn{
    if (btn.tag == 0) {
        //后退
        [self.webView goBack];
    }else if (btn.tag ==1){
        //前进
        [self.webView goForward];
    }else if (btn.tag ==2){
        //主页
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
    }else if(btn.tag == 3){
        //刷新
        [self.webView reload];
    }else{
        NSString * str =[NSString stringWithFormat:@"清理成功，共清理(%.2fM)垃圾",[NSString getFileSizeWithPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches"]]]];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = str;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        for (NSString *p in files) {
            NSError *error;
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }}
    }
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}
// 支持横屏显示
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    // 如果该界面需要支持横竖屏切换
    return UIInterfaceOrientationMaskAll;
    // 如果该界面仅支持横屏
    // return UIInterfaceOrientationMaskLandscapeRight；
}

#pragma mark --------- 加载条代理 ----------------
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_progressLayer startLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_progressLayer finishedLoad];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self->_progressLayer finishedLoad];
    });
}
- (void)dealloc {
    [_progressLayer closeTimer];
    [_progressLayer removeFromSuperlayer];
    _progressLayer = nil;
}

@end
