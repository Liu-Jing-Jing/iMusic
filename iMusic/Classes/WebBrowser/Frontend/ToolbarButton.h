//
//  ToolbarButton.h
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolbarItem.h"
@interface ToolbarButton : UIButton
@property (nonatomic, strong) ToolbarItem *item; //note
- (instancetype)initWithToolbarItem:(ToolbarItem *)item;
@end
