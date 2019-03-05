//
//  Tab.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "Tab.h"

@implementation Tab
- (instancetype)initWithTitle:(NSString *)newTitle url:(NSString *)newUrl
{
    self = [super init];
    if (self)
    {
        self.title = newTitle;
        self.url = newUrl;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {}
    return self;
}
@end
