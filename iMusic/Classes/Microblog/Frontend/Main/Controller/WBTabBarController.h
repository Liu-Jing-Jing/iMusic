//
//  WBTabBarController.h
//  iMusic
//
//  Created by Mark Lewis on 19-3-5.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  判断iOS7及以上版本的系统
 */
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
@interface WBTabBarController : UITabBarController

@end
