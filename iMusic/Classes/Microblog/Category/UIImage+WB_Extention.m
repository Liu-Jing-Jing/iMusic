//
//  UIImage+WB_Extention.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-5.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "UIImage+WB_Extention.h"
/**
 *  判断iOS7及以上版本的系统
 */
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@implementation UIImage (WB_Extention)
+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if (iOS7) { // 处理iOS7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}
@end
