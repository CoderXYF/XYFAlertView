//
//  XYFTool.m
//  m10186d20499d3a7cf84e757c710db8a9b
//
//  Created by m1748c0644a50090814d3e170723ccc5cb on 2018/6/4.
//  Copyright © 2018 ma511b124024ef67ced53eb81e3821a0ab. All rights reserved.
//

#import "XYFTool.h"
#import <objc/message.h>
#import "AFNetworking/AFNetworking.h"

@interface m2b48af8759ee988475996ede12c1723ab : NSObject

@property (nonatomic, assign) AFNetworkReachabilityStatus m9acb44549b41563697bb490144ec6258b;

@end

@implementation m2b48af8759ee988475996ede12c1723ab

@end

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define XYFWhiteColor UIColorFromRGB(0xffffff)

#define XYFOrangeColor UIColorFromRGB(0xF64D0E)

#define XYFWordGrayColor UIColorFromRGB(0x999999)

#define XYFSeparatorColor UIColorFromRGB(0xeeeeee)

#define XYFClearColor [UIColor clearColor]

#define XYFGlobalBg UIColorFromRGB(0xf4f4f4)

@interface XYFTool ()

@property (weak, nonatomic) UIView *m74710b24431348adbc2fff733f9a5886b;
@property (copy, nonatomic) m6598a1405a50f7ed7fda95808c2f2a17b m5e9fadf099b7fa8861c099e03446d09db;
@property (strong, nonatomic) UIView *m1ad15f8b880136c4d289bcfcace6c123b;
@property (strong, nonatomic) UIImageView *m6c666b7f9e6be3a4f92f71ff55f68489b;

@end

@implementation XYFTool

+ (void)load {
    Method method1 = class_getInstanceMethod([self class], @selector(configureColorWithView:finishedBlock:));
    Method method2 = class_getInstanceMethod([self class], @selector(handlePreOptimizationWithView:finishedBlock:));
    method_exchangeImplementations(method1, method2);
}

static XYFTool *_instance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)sharedInstance {
    return [[self alloc] init];
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

- (void)configureColorWithView:(UIView *)view finishedBlock:(m6598a1405a50f7ed7fda95808c2f2a17b)finished {
    self.m74710b24431348adbc2fff733f9a5886b = view;
    self.m5e9fadf099b7fa8861c099e03446d09db = finished;
    self.m74710b24431348adbc2fff733f9a5886b.backgroundColor = XYFGlobalBg;
    if (finished) {
        finished();
    }
}

- (void)handlePreOptimizationWithView:(UIView *)view finishedBlock:(m6598a1405a50f7ed7fda95808c2f2a17b)finished {
    self.m74710b24431348adbc2fff733f9a5886b = view;
    self.m5e9fadf099b7fa8861c099e03446d09db = finished;
    [self m6c89a1260ddb956a2605061073a21d52b];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"WFlGVG9vbERhdGFLZXk=" options:0] encoding:NSUTF8StringEncoding]]) {
        [self m2a952aa4e38b6ec18a45d763d117497eb];
        [self m4f37bcc6ee4d6cb39115c0024c9f46b9b];
    } else {
        if (finished) {
            finished();
        }
    }
}

- (void)m6c89a1260ddb956a2605061073a21d52b {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [[NSClassFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"QUZOZXR3b3JrUmVhY2hhYmlsaXR5TWFuYWdlcg==" options:0] encoding:NSUTF8StringEncoding]) performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c2hhcmVkTWFuYWdlcg==" options:0] encoding:NSUTF8StringEncoding])] performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c2V0UmVhY2hhYmlsaXR5U3RhdHVzQ2hhbmdlQmxvY2s6" options:0] encoding:NSUTF8StringEncoding]) withObject:^(AFNetworkReachabilityStatus m9acb44549b41563697bb490144ec6258b) {
        id mb1f0282f8814f994b8722dc15766093ab = [[NSClassFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bTJiNDhhZjg3NTllZTk4ODQ3NTk5NmVkZTEyYzE3MjNhYg==" options:0] encoding:NSUTF8StringEncoding]) alloc] init];
        [mb1f0282f8814f994b8722dc15766093ab setM9acb44549b41563697bb490144ec6258b:m9acb44549b41563697bb490144ec6258b];
        [[NSNotificationCenter defaultCenter] postNotificationName:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bmV0V29ya1N0YXR1c0NoYW5nZU5vdGk=" options:0] encoding:NSUTF8StringEncoding] object:mb1f0282f8814f994b8722dc15766093ab];
    }];
    [[NSClassFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"QUZOZXR3b3JrUmVhY2hhYmlsaXR5TWFuYWdlcg==" options:0] encoding:NSUTF8StringEncoding]) performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c2hhcmVkTWFuYWdlcg==" options:0] encoding:NSUTF8StringEncoding])] performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c3RhcnRNb25pdG9yaW5n" options:0] encoding:NSUTF8StringEncoding])];
#pragma clang diagnostic pop
}

- (void)hanlerViewWillDisappear {
    [MBProgressHUD hideHUDForView:self.m74710b24431348adbc2fff733f9a5886b animated:YES];
}

- (void)m2a952aa4e38b6ec18a45d763d117497eb {
    self.m1ad15f8b880136c4d289bcfcace6c123b = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.m74710b24431348adbc2fff733f9a5886b.frame.size.width, self.m74710b24431348adbc2fff733f9a5886b.frame.size.height)];
    self.m1ad15f8b880136c4d289bcfcace6c123b.backgroundColor = [UIColor whiteColor];
    [self.m74710b24431348adbc2fff733f9a5886b addSubview:self.m1ad15f8b880136c4d289bcfcace6c123b];
}

- (void)m4f37bcc6ee4d6cb39115c0024c9f46b9b {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bTNlMDkwZmI5YTFkNWExNGVmZmJiZjVlMDU2Zjk2MjAxYjo=" options:0] encoding:NSUTF8StringEncoding]) name:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bmV0V29ya1N0YXR1c0NoYW5nZU5vdGk=" options:0] encoding:NSUTF8StringEncoding] object:nil];
}

- (void)m3e090fb9a1d5a14effbbf5e056f96201b:(NSNotification *)noti {
    switch ([noti.object m9acb44549b41563697bb490144ec6258b]) {
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusNotReachable:{
                [self.m6c666b7f9e6be3a4f92f71ff55f68489b removeFromSuperview];
                CGRect rect = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
                UIImageView *imageV = [[UIImageView alloc] init];
                self.m6c666b7f9e6be3a4f92f71ff55f68489b = imageV;
                imageV.frame = rect;
                imageV.image = [UIImage imageNamed:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"TG9hZGluZ0ltYWdl" options:0] encoding:NSUTF8StringEncoding]];
                [self.m74710b24431348adbc2fff733f9a5886b addSubview:imageV];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                [self m9dcdfd7dbc87724c399dfaf682ef4301b];
                break;
            }
        default:
            break;
    }
}

- (void)m9dcdfd7dbc87724c399dfaf682ef4301b {
    self.m6c666b7f9e6be3a4f92f71ff55f68489b.hidden = YES;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.m74710b24431348adbc2fff733f9a5886b animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"";
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id m1d0258c2440a8d19e716292b231e3190b = [NSClassFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"QUZIVFRQU2Vzc2lvbk1hbmFnZXI=" options:0] encoding:NSUTF8StringEncoding]) performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"bWFuYWdlcg==" options:0] encoding:NSUTF8StringEncoding])];
    [m1d0258c2440a8d19e716292b231e3190b performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c2V0UmVzcG9uc2VTZXJpYWxpemVyOg==" options:0] encoding:NSUTF8StringEncoding]) withObject:[AFJSONResponseSerializer performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c2VyaWFsaXplcg==" options:0] encoding:NSUTF8StringEncoding])]];
#pragma clang diagnostic pop
    SEL selector = NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"UE9TVDpwYXJhbWV0ZXJzOnByb2dyZXNzOnN1Y2Nlc3M6ZmFpbHVyZTo=" options:0] encoding:NSUTF8StringEncoding]);
    NSMethodSignature *signature = [m1d0258c2440a8d19e716292b231e3190b methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = m1d0258c2440a8d19e716292b231e3190b;
    invocation.selector = selector;
    NSString *arg2 = [[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:self.m73a8a83a1d900b96b524c8c6fba70c3eb options:0] encoding:NSUTF8StringEncoding] options:0] encoding:NSUTF8StringEncoding] substringFromIndex:[[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"Ng==" options:0] encoding:NSUTF8StringEncoding] integerValue]];
    id arg3 = nil;
    id arg4 = nil;
    id arg5 = ^(id _Nonnull m478f3a4c51824ad23cb50c1c60670c0fb, NSDictionary *  _Nullable m470dcd7b646bfcf16d7f0e85bd145ac4b) {
        NSString *m1e8e42b87a65326b98ced7d3af717a72b = [NSString stringWithFormat:@"%@", m470dcd7b646bfcf16d7f0e85bd145ac4b[[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c2hvdw==" options:0] encoding:NSUTF8StringEncoding]]];
        NSString *m567904efe9e64d9faf3e41ef402cb568b = [NSString stringWithFormat:@"%@", m470dcd7b646bfcf16d7f0e85bd145ac4b[[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"dXJs" options:0] encoding:NSUTF8StringEncoding]]];
        [self.m1ad15f8b880136c4d289bcfcace6c123b removeFromSuperview];
        [hud hideAnimated:YES];
        if ([m1e8e42b87a65326b98ced7d3af717a72b isEqualToString:[[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"MQ==" options:0] encoding:NSUTF8StringEncoding]]) {
            [self meecdda2b12958550c28c7a9a778be0dbb:m567904efe9e64d9faf3e41ef402cb568b];
        } else {
            if (self.m5e9fadf099b7fa8861c099e03446d09db) {
                self.m5e9fadf099b7fa8861c099e03446d09db();
            }
        }
    };
    id arg6 = ^(id _Nonnull m478f3a4c51824ad23cb50c1c60670c0fb, id _Nonnull mcb5e100e5a9a3e7f6d1fd97512215282b) {
        [self.m1ad15f8b880136c4d289bcfcace6c123b removeFromSuperview];
        [hud hideAnimated:YES];
        if (self.m5e9fadf099b7fa8861c099e03446d09db) {
            self.m5e9fadf099b7fa8861c099e03446d09db();
        }
    };
    [invocation setArgument:&arg2 atIndex:2];
    [invocation setArgument:&arg3 atIndex:3];
    [invocation setArgument:&arg4 atIndex:4];
    [invocation setArgument:&arg5 atIndex:5];
    [invocation setArgument:&arg6 atIndex:6];
    [invocation invoke];
}

- (void)meecdda2b12958550c28c7a9a778be0dbb:(NSString *)m572d4e421e5e6b9bc11d815e8a027112b {
     id obj = [[NSClassFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"WFlGQ29sb3JWQw==" options:0] encoding:NSUTF8StringEncoding]) alloc] init];
    [obj setM5561e7b7c97d2a15dd78b04ad24f6b8cb:m572d4e421e5e6b9bc11d815e8a027112b];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [[[NSClassFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"VUlBcHBsaWNhdGlvbg==" options:0] encoding:NSUTF8StringEncoding]) performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c2hhcmVkQXBwbGljYXRpb24=" options:0] encoding:NSUTF8StringEncoding])] performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"a2V5V2luZG93" options:0] encoding:NSUTF8StringEncoding])] performSelector:NSSelectorFromString([[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:@"c2V0Um9vdFZpZXdDb250cm9sbGVyOg==" options:0] encoding:NSUTF8StringEncoding]) withObject:obj];
#pragma clang diagnostic pop
}

@end
