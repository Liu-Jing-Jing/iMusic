//
//  ToolbarItem.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "ToolbarItem.h"

@implementation ToolbarItem
+ (instancetype)toolbarItemWithTitle:(NSString *)title andImageName:(NSString *)imageStr vc:(UIViewController *)vc
{
    ToolbarItem *item = [[ToolbarItem alloc] init];
    item.title = title;
    item.imageName = imageStr;
    item.viewController = vc;
    
    return item;
}
@end
