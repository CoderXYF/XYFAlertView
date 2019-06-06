//
//  XYFCleanCache.h
//  NewProjects
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 DSOperation. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^cleanCacheBlock)(void);

@interface XYFCleanCache : NSObject

+ (void)cleanCache:(cleanCacheBlock)block;

+ (float)folderSizeAtPath;

@end
