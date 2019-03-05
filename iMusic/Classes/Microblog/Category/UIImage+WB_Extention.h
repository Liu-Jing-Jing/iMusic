//
//  UIImage+WB_Extention.h
//  iMusic
//
//  Created by Mark Lewis on 19-3-5.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WB_Extention)
/**
 *  兼容新浪的iOS 5,6,7图片适配的工具方法Category
 *
 *  @param name 原始图片名
 *
 *  @return 返回对应版本的图片名
 */
+ (UIImage *)imageWithName:(NSString *)name;
@end
