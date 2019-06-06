//
//  UIWebView+XYFProgress.m
//  NewProjects
//
//  Created by XYF on 2018/6/4.
//  Copyright © 2018年 XYF. All rights reserved.
//

#import "UIWebView+XYFProgress.h"
#import <objc/runtime.h>
#import "XYFProgressLayer.h"

static inline void xyf_swizzleSelector(Class clazz, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    Method swizzleMethod = class_getInstanceMethod(clazz, swizzledSelector);
    BOOL success = class_addMethod(clazz, originalSelector,method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (success) {
        class_replaceMethod(clazz, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
}

@interface UIWebView ()

@property (nonatomic, strong) id xyf_delegate;

@end

@implementation UIWebView (XYFProgress)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        xyf_swizzleSelector(class, @selector(initWithFrame:), @selector(xyf_initWithFrame:));
        xyf_swizzleSelector(class, @selector(initWithCoder:), @selector(xyf_initWithCoder:));
        xyf_swizzleSelector(class, @selector(setDelegate:), @selector(xyf_setDelegate:));
        xyf_swizzleSelector(class, NSSelectorFromString(@"dealloc"), @selector(xyf_dealloc));
    });
}

- (XYFProgressLayer *)xyf_progressLayer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setXyf_progressLayer:(XYFProgressLayer *)xyf_progressLayer {
    if (xyf_progressLayer && self.xyf_progressLayer) {
        [self.xyf_progressLayer removeFromSuperlayer];
        self.xyf_progressLayer = nil;
    }
    objc_setAssociatedObject(self, @selector(xyf_progressLayer), xyf_progressLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)xyf_delegate {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setXyf_delegate:(id)xyf_delegate {
    objc_setAssociatedObject(self, @selector(xyf_delegate), xyf_delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<UIWebViewDelegate>)xyf_targetProxy {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setXyf_targetProxy:(id<UIWebViewDelegate>)xyf_targetProxy {
    objc_setAssociatedObject(self, @selector(xyf_targetProxy), xyf_targetProxy, OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)xyf_showProgressLayer {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setXyf_showProgressLayer:(BOOL)xyf_showProgressLayer {
    objc_setAssociatedObject(self, @selector(xyf_showProgressLayer), @(xyf_showProgressLayer), OBJC_ASSOCIATION_ASSIGN);
    if (xyf_showProgressLayer) {
        [self setDelegate:self.xyf_targetProxy];
    }
}

#pragma mark - method swizzling

- (instancetype)xyf_initWithFrame:(CGRect)frame {
    UIWebView *webView = [self xyf_initWithFrame:frame];
    /** 默认显示加载进度条 */
    webView.xyf_showProgressLayer = YES;
    return webView;
}

- (instancetype)xyf_initWithCoder:(NSCoder *)aDecoder {
    UIWebView *webView = [self xyf_initWithCoder:aDecoder];
    /** 默认显示加载进度条 */
    webView.xyf_showProgressLayer = YES;
    return webView;
}

- (void)xyf_setDelegate:(id <UIWebViewDelegate>)delegate {
    self.xyf_targetProxy = delegate;
    if (!self.xyf_showProgressLayer) {
        [self xyf_setDelegate:delegate];
        return;
    }
    /** 动态创建progressDelegate */
    Class clazz = [self xyf_allocPorgressDelegate];

    if (!clazz) {
        [self xyf_setDelegate:delegate];
        return;
    }

    id xyf_delegate = [[clazz alloc] init];
    self.xyf_delegate = xyf_delegate;
    [self xyf_setDelegate:xyf_delegate];
}

- (void)xyf_dealloc {
    if (self.xyf_progressLayer) {
        [self.xyf_progressLayer setHidden:YES];
        [self.xyf_progressLayer removeFromSuperlayer];
    }
    self.xyf_delegate = nil;
    [self xyf_dealloc];
}

#pragma mark - private method

- (Class)xyf_allocPorgressDelegate {
    const char * className;
    className = [@"XYFProgressDelegate" UTF8String];
    Class clazz = objc_getClass(className);
    /** 判断此类是否已经存在，如果存在则返回，不存在就创建 */
    if (!clazz) {
        Class superClass = [NSObject class];
        clazz = objc_allocateClassPair(superClass, className, 0);
    }

    /** 为类添加成员变量\方法 */
    class_addMethod(clazz, @selector(webViewDidStartLoad:), (IMP)xyf_webViewDidStartLoad, "V@:");
    class_addMethod(clazz, @selector(webViewDidFinishLoad:), (IMP)xyf_webViewDidFinishLoad, "V@:");
    class_addMethod(clazz, @selector(webView:didFailLoadWithError:), (IMP)xyf_webViewDidFailLoadWithError, "V@:");
    class_addMethod(clazz, @selector(webView:shouldStartLoadWithRequest:navigationType:), (IMP)xyf_webViewShouldStartLoadWithRequestNavigationType, "V@:");

    /** 注册这个类到runtime系统 */
    objc_registerClassPair(clazz);
    return clazz;
}

#pragma mark - method custom implementation

static void xyf_webViewDidStartLoad (id self, SEL _cmd, UIWebView *webView) {
    [webView.xyf_progressLayer progressAnimationStart];
    if (webView.xyf_targetProxy && [webView.xyf_targetProxy respondsToSelector:_cmd]) {
        [webView.xyf_targetProxy webViewDidStartLoad:webView];
    }
}

static inline void xyf_webViewDidFinishLoad (id self, SEL _cmd, UIWebView *webView) {
    [webView.xyf_progressLayer progressAnimationCompletion];
    if (webView.xyf_targetProxy && [webView.xyf_targetProxy respondsToSelector:_cmd]) {
        [webView.xyf_targetProxy webViewDidFinishLoad:webView];
    }
}

static inline void xyf_webViewDidFailLoadWithError (id self, SEL _cmd, UIWebView *webView, NSError *error) {
    [webView.xyf_progressLayer progressAnimationCompletion];
    if (webView.xyf_targetProxy && [webView.xyf_targetProxy respondsToSelector:_cmd]) {
        [webView.xyf_targetProxy webView:webView didFailLoadWithError:error];
    }
}

static inline BOOL xyf_webViewShouldStartLoadWithRequestNavigationType (id self, SEL _cmd, UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType) {
    if (webView.xyf_targetProxy && [webView.xyf_targetProxy respondsToSelector:_cmd]) {
        return [webView.xyf_targetProxy webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    return YES;
}

@end
