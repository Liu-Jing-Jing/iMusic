//
//  TabsResponse.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "TabsResponse.h"

@implementation TabsResponse
- (NSMutableArray *)clients
{
    if (_clients == nil)
    {
        _clients = [NSMutableArray arrayWithArray:@[]];
    }
    
    return _clients;
}
@end
