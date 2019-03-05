//
//  ToolbarItem.h
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolbarItem : NSObject
@property (nonatomic, strong) NSString *title; //note
@property (nonatomic, strong) NSString *imageName; //note
@property (nonatomic, strong) UIViewController *viewController; //note

+ (instancetype)toolbarItemWithTitle:(NSString *)title andImageName:(NSString *)imageStr vc:(UIViewController *)vc;
@end