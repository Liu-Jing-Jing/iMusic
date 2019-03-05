//
//  TabsResponse.h
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabClient.h"
@interface TabsResponse : NSObject
@property (nonatomic, strong) NSMutableArray *clients; //c存储的TabClient对象

@end
