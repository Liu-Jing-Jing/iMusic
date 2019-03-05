//
//  Constant.h
//  iMusic
//
//  Created by Mark Lewis on 19-3-5.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#ifndef iMusic_Constant_h
#define iMusic_Constant_h
/**
 *  Objective-C的常量和宏
 */
#ifdef __OBJC__
#import "UIImage+WB_Extention.h"
/**
 *  自定义调试Log函数
 *
 *  @param fmt
 *  @param fmt
 *  @param __PRETTY_FUNCTION__
 *  @param ##__VA_ARGS__
 *
 */
// 1.自定义调试Log函数
#ifdef DEBUG
#   define MKLog(fmt, ...) NSLog((@"%s " fmt), __PRETTY_FUNCTION__, ##__VA_ARGS__);
// #   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define MKLog(...)
//#   define DLog(...)
#endif

// 3. 本地化项目的东西
#define NSStringLocalizedWB(key, comment) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:(@"Microblog_Localization")]

// 4.获得RGB颜色
#define MKLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 4 test随机色
#define ZZRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#endif
//Objective-C的常量和宏







#endif
