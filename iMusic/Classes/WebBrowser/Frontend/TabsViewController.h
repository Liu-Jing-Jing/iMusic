//
//  TabsViewController.h
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabsResponse;
@interface TabsViewController : UITableViewController
@property (nonatomic, strong) TabsResponse *tabsResponse;
@end
