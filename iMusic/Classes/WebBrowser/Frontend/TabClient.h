//
//  TabClient.h
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tab.h"
@interface TabClient : NSObject
@property (nonatomic, strong) NSString *name; //note
@property (nonatomic, strong) NSArray *tabs; // Tab对象数组的

@end
